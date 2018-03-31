
`timescale 1 ns / 1 ps

	module mic_axis_ip_v1_0_M00_AXIS #
	(
		// Users to add parameters here
        parameter integer NUM_BITS = 8,
        parameter integer CLK_BITS = 4,
        parameter integer STRM_COUNT_BITS = 14,
        parameter integer NUM_CHUNK_BITS = 8,

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		parameter integer C_M_AXIS_TDATA_WIDTH	= 16,
		// Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.
		parameter integer C_M_START_COUNT	= 32
	)
	(
		// Users to add ports here
		
		output wire mic_clk_o,
		input wire mic_data_i,
		output wire mic_lrsel_o,
		
		input wire btn_d,

		// User ports ends
		// Do not modify the ports beyond this line

		// Global ports
		input wire  M_AXIS_ACLK,
		// 
		input wire  M_AXIS_ARESETN,
		// Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted. 
		output wire  M_AXIS_TVALID,
		// TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
		output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
		// TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB,
		// TLAST indicates the boundary of a packet.
		output wire  M_AXIS_TLAST,
		// TREADY indicates that the slave can accept a transfer in the current cycle.
		input wire  M_AXIS_TREADY
	);
	//Total number of output data.
	// Total number of output data                                                 
	localparam NUMBER_OF_OUTPUT_WORDS = 8;                                               
	                                                                                     
	// function called clogb2 that returns an integer which has the                      
	// value of the ceiling of the log base 2.                                           
	function integer clogb2 (input integer bit_depth);                                   
	  begin                                                                              
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                                      
	      bit_depth = bit_depth >> 1;                                                    
	  end                                                                                
	endfunction                                                                          
	                                                                                     
	// WAIT_COUNT_BITS is the width of the wait counter.                                 
	localparam integer WAIT_COUNT_BITS = clogb2(C_M_START_COUNT-1);                      
	                                                                                     
	// bit_num gives the minimum number of bits needed to address 'depth' size of FIFO.  
	localparam bit_num  = clogb2(NUMBER_OF_OUTPUT_WORDS);                                
	                                                                                     
	// Define the states of state machine                                                
	// The control state machine oversees the writing of input streaming data to the FIFO,
	// and outputs the streaming data from the FIFO                                      
	parameter [1:0] IDLE = 2'b00,        // This is the initial/idle state               
	                                                                                     
	                INIT_COUNTER  = 2'b01, // This state initializes the counter, ones   
	                                // the counter reaches C_M_START_COUNT count,        
	                                // the state machine changes state to INIT_WRITE     
	                SEND_STREAM   = 2'b10; // In this state the                          
	                                     // stream data is output through M_AXIS_TDATA   
	// State variable                                                                    
	reg [1:0] mst_exec_state;                                                            
	// Example design FIFO read pointer                                                  
	reg [bit_num-1:0] read_pointer;                                                      

	// AXI Stream internal signals
	//wait counter. The master waits for the user defined number of clock cycles before initiating a transfer.
	reg [WAIT_COUNT_BITS-1 : 0] 	count;
	//streaming data valid
	wire  	axis_tvalid;
	//streaming data valid delayed by one clock cycle
	reg  	axis_tvalid_delay;
	//Last of the streaming data 
	wire  	axis_tlast;
	//Last of the streaming data delayed by one clock cycle
	reg  	axis_tlast_delay;
	//FIFO implementation signals
	reg [C_M_AXIS_TDATA_WIDTH-1 : 0] 	stream_data_out;
	wire  	tx_en;
	//The master has issued all the streaming data stored in FIFO
	reg  	tx_done;


	// I/O Connections assignments

	assign M_AXIS_TVALID	= axis_tvalid_delay;
	assign M_AXIS_TDATA	= stream_data_out;
	assign M_AXIS_TLAST	= axis_tlast_delay;
	assign M_AXIS_TSTRB	= {(C_M_AXIS_TDATA_WIDTH/8){1'b1}};


	// Control state machine implementation                             
	/*always @(posedge M_AXIS_ACLK)                                             
	begin                                                                     
	  if (!M_AXIS_ARESETN)                                                    
	  // Synchronous reset (active low)                                       
	    begin                                                                 
	      mst_exec_state <= IDLE;                                             
	      count    <= 0;                                                      
	    end                                                                   
	  else                                                                    
	    case (mst_exec_state)                                                 
	      IDLE:                                                               
	        // The slave starts accepting tdata when                          
	        // there tvalid is asserted to mark the                           
	        // presence of valid streaming data                               
	        //if ( count == 0 )                                                 
	        //  begin                                                           
	            mst_exec_state  <= INIT_COUNTER;                              
	        //  end                                                             
	        //else                                                              
	        //  begin                                                           
	        //    mst_exec_state  <= IDLE;                                      
	        //  end                                                             
	                                                                          
	      INIT_COUNTER:                                                       
	        // The slave starts accepting tdata when                          
	        // there tvalid is asserted to mark the                           
	        // presence of valid streaming data                               
	        if ( count == C_M_START_COUNT - 1 )                               
	          begin                                                           
	            mst_exec_state  <= SEND_STREAM;                               
	          end                                                             
	        else                                                              
	          begin                                                           
	            count <= count + 1;                                           
	            mst_exec_state  <= INIT_COUNTER;                              
	          end                                                             
	                                                                          
	      SEND_STREAM:                                                        
	        // The example design streaming master functionality starts       
	        // when the master drives output tdata from the FIFO and the slave
	        // has finished storing the S_AXIS_TDATA                          
	        if (tx_done)                                                      
	          begin                                                           
	            mst_exec_state <= IDLE;                                       
	          end                                                             
	        else                                                              
	          begin                                                           
	            mst_exec_state <= SEND_STREAM;                                
	          end                                                             
	    endcase                                                               
	end                                                                       


	//tvalid generation
	//axis_tvalid is asserted when the control state machine's state is SEND_STREAM and
	//number of output streaming data is less than the NUMBER_OF_OUTPUT_WORDS.
	assign axis_tvalid = ((mst_exec_state == SEND_STREAM) && (read_pointer < NUMBER_OF_OUTPUT_WORDS));
	                                                                                               
	// AXI tlast generation                                                                        
	// axis_tlast is asserted number of output streaming data is NUMBER_OF_OUTPUT_WORDS-1          
	// (0 to NUMBER_OF_OUTPUT_WORDS-1)                                                             
	assign axis_tlast = (read_pointer == NUMBER_OF_OUTPUT_WORDS-1);                                
	                                                                                               
	                                                                                               
	// Delay the axis_tvalid and axis_tlast signal by one clock cycle                              
	// to match the latency of M_AXIS_TDATA                                                        
	always @(posedge M_AXIS_ACLK)                                                                  
	begin                                                                                          
	  if (!M_AXIS_ARESETN)                                                                         
	    begin                                                                                      
	      axis_tvalid_delay <= 1'b0;                                                               
	      axis_tlast_delay <= 1'b0;                                                                
	    end                                                                                        
	  else                                                                                         
	    begin                                                                                      
	      axis_tvalid_delay <= axis_tvalid;                                                        
	      axis_tlast_delay <= axis_tlast;                                                          
	    end                                                                                        
	end                                                                                            


	//read_pointer pointer

	always@(posedge M_AXIS_ACLK)                                               
	begin                                                                            
	  if(!M_AXIS_ARESETN)                                                            
	    begin                                                                        
	      read_pointer <= 0;                                                         
	      tx_done <= 1'b0;                                                           
	    end                                                                          
	  else                                                                           
	    if (read_pointer <= NUMBER_OF_OUTPUT_WORDS-1)                                
	      begin                                                                      
	        if (tx_en)                                                               
	          // read pointer is incremented after every read from the FIFO          
	          // when FIFO read signal is enabled.                                   
	          begin                                                                  
	            read_pointer <= read_pointer + 1;                                    
	            tx_done <= 1'b0;                                                     
	          end                                                                    
	      end                                                                        
	    else if (read_pointer == NUMBER_OF_OUTPUT_WORDS)                             
	      begin                                                                      
	        // tx_done is asserted when NUMBER_OF_OUTPUT_WORDS numbers of streaming data
	        // has been out.                                                         
	        tx_done <= 1'b1;                                                         
	      end                                                                        
	end                                                                              


	//FIFO read enable generation 

	assign tx_en = M_AXIS_TREADY && axis_tvalid;   
	                                                     
	    // Streaming output data is read from FIFO       
	    always @( posedge M_AXIS_ACLK )                  
	    begin                                            
	      if(!M_AXIS_ARESETN)                            
	        begin                                        
	          stream_data_out <= 1;                      
	        end                                          
	      else if (tx_en)// && M_AXIS_TSTRB[byte_index]  
	        begin                                        
	          stream_data_out <= read_pointer + 32'b1;   
	        end                                          
	    end   */                                           

	// Add user logic here
	
	
	
    assign mic_lrsel_o = 1'b0;
    
    reg [NUM_BITS-1:0] data_tmp;
    reg [NUM_BITS-1:0] data_tmp_r;
    reg [NUM_BITS-1:0] counter;
    reg done_r;
    reg [CLK_BITS-1:0] clk_counter;
    reg mic_clk_r;
    reg mic_clk_rising;
        
    reg [STRM_COUNT_BITS-1:0] stream_counter = 0;
    reg btn_flag;
    
    // detect button press
    always @(posedge M_AXIS_ACLK) begin
        if (!M_AXIS_ARESETN) begin
            btn_flag <= 0;
        end
        else begin
            if (btn_d) begin
                btn_flag <= 1;
            end
            else if (done_r && stream_counter == {STRM_COUNT_BITS{1'b1}}) begin
                btn_flag <= 0;
            end
        end
    end    
    
    // make slower clock
    always @(posedge M_AXIS_ACLK) begin
        mic_clk_rising <= 1'b0;
        if (!M_AXIS_ARESETN) begin
            clk_counter <= 0;
            mic_clk_r <= 1'b0;
            mic_clk_rising <= 1'b0;
        end
        else begin
            clk_counter <= clk_counter + 1;
        end
        if (clk_counter == 0) begin
            mic_clk_r <= ~mic_clk_r;
            if (!mic_clk_r) begin
                mic_clk_rising <= 1'b1;
            end
        end
    end
    assign mic_clk_o = mic_clk_r;
    
    // make the counter count
    always @(posedge M_AXIS_ACLK) begin
        if (!M_AXIS_ARESETN) begin
            counter <= 0;
        end
        else begin
            if (mic_clk_rising & btn_flag) begin
                counter <= counter + 1;
            end
            else if (done_r && stream_counter == {STRM_COUNT_BITS{1'b1}}) begin
                counter <= 0;
            end
        end
    end
    
    always @(posedge M_AXIS_ACLK) begin
        if (!M_AXIS_ARESETN) begin
            data_tmp <= 0;
            done_r <= 0;
        end
        else begin
            done_r <= 0;
            if (mic_clk_rising) begin
                if (mic_data_i) begin
                    data_tmp <= data_tmp + 1;
                end
                if (counter == {NUM_BITS{1'b1}}) begin
                    done_r <= 1;
                    data_tmp_r <= data_tmp;
                    data_tmp <= 0;
                end
            end
        end
    end

    always @(posedge M_AXIS_ACLK) begin
        if (!M_AXIS_ARESETN) begin
            stream_data_out <= 0;
            axis_tvalid_delay <= 0;
            axis_tlast_delay <= 0;
            stream_counter <= 0;
        end
        else begin
            if (done_r) begin
                stream_data_out <= data_tmp_r;
                axis_tvalid_delay <= 1;
                stream_counter <= stream_counter + 1;
                
                if (stream_counter[NUM_CHUNK_BITS-1:0] == {NUM_CHUNK_BITS{1'b1}}) begin
                    axis_tlast_delay <= 1;
                    if (stream_counter == {STRM_COUNT_BITS{1'b1}}) begin
                        stream_counter <= 0;
                    end
                end
                else begin
                    axis_tlast_delay <= 0;
                end
            end
            else begin
                axis_tvalid_delay <= 0;
                axis_tlast_delay <= 0;
            end
        end
    end

	// User logic ends

	endmodule
