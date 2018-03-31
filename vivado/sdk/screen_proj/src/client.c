
#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif
#include "sleep.h"


#define BUFF_SIZE 	108
#define NUM_CHUNKS  15

#define STATE_IDLE 0
#define STATE_CONN_1_READY 1
#define STATE_CONN_1_WAIT 2
#define STATE_CONN_2_READY 3
#define STATE_CONN_2_WAIT 4
#define STATE_CONN_3_READY 5
#define STATE_CONN_3_WAIT 6
#define STATE_CONN_4_READY 7
#define STATE_CONN_4_WAIT 8
#define STATE_CONN_5_READY 9
#define STATE_CONN_5_WAIT 10
#define STATE_CONN_6_READY 11
#define STATE_CONN_6_WAIT 12
#define STATE_CONN_7_READY 13
#define STATE_CONN_7_WAIT 14

struct connect_arg_t{
	unsigned int *data;
	int phase;
	int *state_p;
};

void delay(int delays){

	volatile int i = 0;
	volatile int j = 0;
	for(; i < delays; ++i)j++;
	return;
}

err_t receive_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	struct connect_arg_t* args = (struct connect_arg_t*) arg;

	static int bytes_so_far = 0;
	unsigned char *image = (unsigned char *) args->data;

	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		xil_printf("client closed now\n");
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
	xil_printf("len:%d\n",p->len);

	for (int i = 0; i < p->len; i++) {
		image[i + bytes_so_far] = ((unsigned char *) p->payload)[i];
	}

	bytes_so_far += p->len;

	/*unsigned int value = 0;
	unsigned char* temp = p->payload;
	for (int i = 0; i < p->len; i++) {
		unsigned char temp2 = *temp;
		value <<= 8;
		value |= temp2;
		xil_printf("data received: %x\n", temp2);
		temp++;
	}*/
	//*(args->data) = p->;

	/* free the received pbuf */
	pbuf_free(p);

	if (bytes_so_far > 12288) {
		// update state
		if (*(args->state_p) == STATE_CONN_7_WAIT) {
			*(args->state_p) = STATE_IDLE;
		}
		bytes_so_far = 0;
	}
	else {
		tcp_recv(tpcb, receive_callback);
	}

	return ERR_OK;
}

 err_t connect_callback (void *arg, struct tcp_pcb *tpcb, err_t err){

	struct connect_arg_t* args = (struct connect_arg_t*) arg;
	xil_printf("%d\n", args->phase);

 	xil_printf("connected callback called\n");

 	if (args->phase == 1) { // transmit
 		int chunk;
 		for (chunk = 0; chunk < NUM_CHUNKS; chunk++) { // FIXME
			unsigned char data[BUFF_SIZE];
			int i;
			unsigned int *sw_data_p = args->data;
			for (i = 0; i < BUFF_SIZE; i += 4) {
				unsigned int sw_data = *sw_data_p;
				//xil_printf("%d\n", sw_data);
				data[i]   = (sw_data >> 24) & 0xff;
				data[i+1] = (sw_data >> 16) & 0xff;
				data[i+2] = (sw_data >>  8) & 0xff;
				data[i+3] =  sw_data        & 0xff;
				sw_data_p++;
			}
			//unsigned char *sw_data_p = args->data + (chunk * (BUFF_SIZE - 4));
			//xil_printf("started sending %d\n", chunk);
			/*for (i = 4; i < BUFF_SIZE; i++) {
				data[i] = sw_data_p[i - 4];
			}*/

			while (1) {
				int space = tcp_sndbuf(tpcb);
				//xil_printf("buf space: %d\n", space);
				//xil_printf("buf queuelen: %d\n", tcp_sndqueuelen(tpcb));
				if (space >= BUFF_SIZE) {
					break;
				}
				delay(1000000);
			}

			err_t write_error = tcp_write(tpcb, (void*) data, BUFF_SIZE, TCP_WRITE_FLAG_COPY);
			//delay(1000000);
			if(write_error != ERR_OK){
				xil_printf("Error: failed to write data to pcb buffer %d\n", write_error);
				delay(1000);
			}
			else{

				if(tcp_output(tpcb) != ERR_OK){
					xil_printf("Error: failed to send data to server\n");
					delay(1000);
				}
			}
 		}

 		xil_printf("waiting to close...\n");
 		while (1) {
 	 		delay(10000);
			if(tcp_close(tpcb) == ERR_OK){
				xil_printf("client closed now\n");
				break;
			}
 		}

		//sleep(1);

 		// update state
 		if (*(args->state_p) == STATE_CONN_1_WAIT) {
 			*(args->state_p) = STATE_CONN_2_READY;
 		}
 		else if (*(args->state_p) == STATE_CONN_2_WAIT) {
 			*(args->state_p) = STATE_CONN_3_READY;
 		}
 		else if (*(args->state_p) == STATE_CONN_3_WAIT) {
 			*(args->state_p) = STATE_CONN_4_READY;
 			//*(args->state_p) = STATE_IDLE;
 		}
 		else if (*(args->state_p) == STATE_CONN_4_WAIT) {
 			*(args->state_p) = STATE_CONN_5_READY;
 		}
 		else if (*(args->state_p) == STATE_CONN_5_WAIT) {
 			*(args->state_p) = STATE_CONN_6_READY;
 		}
 		else if (*(args->state_p) == STATE_CONN_6_WAIT) {
			*(args->state_p) = STATE_CONN_7_READY;
 			//*(args->state_p) = STATE_IDLE;
		}
 	}
 	else if (args->phase == 2) { // receive
 		unsigned char get_data[3] = {0x47, 0x45, 0x54};

 		/* set the receive callback for this connection */
		tcp_recv(tpcb, receive_callback);
 		err_t write_error = tcp_write(tpcb,(void*)get_data, 3, TCP_WRITE_FLAG_COPY);
 	}
 	return ERR_OK;
 }


int run(int phase, unsigned int *data, int *state_p){

	struct tcp_pcb *pcb;
	err_t connect_err;
	u16_t port = 7;
	struct ip_addr ipaddr;

	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	IP4_ADDR(&ipaddr,  192, 168,   1, 109); //set up the server IP address
	static struct connect_arg_t arg;
	arg.phase = phase;
	arg.state_p = state_p;
	arg.data = data;
	tcp_arg(pcb, (void*)&arg);
	connect_err = tcp_connect(pcb, &ipaddr, port, connect_callback);
	if(connect_err == ERR_OK){
		xil_printf("Connect request has been sent from client\n");
	}
	else if(connect_err == ERR_VAL){
		xil_printf("Error: Invalid arguments passed\n");
	}
	else{
		xil_printf("Error: failed to send connect request\n");
	}
	xil_printf("client should be connected and starts sending data\n");

	return 0;
}
