/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>

#include "xparameters.h"

#include "netif/xadapter.h"

#include "platform.h"
#include "platform_config.h"
#if defined (__arm__) || defined(__aarch64__)
#include "xil_printf.h"
#endif

#include "lwip/tcp.h"
#include "xil_cache.h"

#if LWIP_DHCP==1
#include "lwip/dhcp.h"
#endif

#include "bitmap.h"
#include "PmodOLEDrgb.h"
#include "sleep.h"

/* PMOD screen */
void DemoInitialize();
void DemoRun();
void DemoCleanup();
void EnableCaches();
void DisableCaches();

PmodOLEDrgb oledrgb;

/* defined by each RAW mode application */
void print_app_header();
int run(int phase, unsigned int *data, int *flag_p);
int start_application();
int transfer_data();
void tcp_fasttmr(void);
void tcp_slowtmr(void);

/* missing declaration in lwIP */
void lwip_init();

#if LWIP_DHCP==1
extern volatile int dhcp_timoutcntr;
err_t dhcp_start(struct netif *netif);
#endif

extern volatile int TcpFastTmrFlag;
extern volatile int TcpSlowTmrFlag;
static struct netif server_netif;
struct netif *echo_netif;

#define SLEEP for(volatile int random_int = 0; random_int < 100; random_int++);

#define NUM_FFT_CHUNKS (64+62+60)
#define NUM_FILTERS 13
#define NUM_VALS (NUM_FILTERS * NUM_FFT_CHUNKS)

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

void
print_ip(char *msg, struct ip_addr *ip) 
{
	print(msg);
	xil_printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip), 
			ip4_addr3(ip), ip4_addr4(ip));
}

void
print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

int main()
{
	// start screen
	DemoInitialize();

	struct ip_addr ipaddr, netmask, gw;

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] =
	{ 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

	echo_netif = &server_netif;

	init_platform();

	print_app_header();

	lwip_init();

  	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(echo_netif, &ipaddr, &netmask,
						&gw, mac_ethernet_address,
						PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\n\r");
		return -1;
	}
	netif_set_default(echo_netif);

	/* now enable interrupts */
	platform_enable_interrupts();

	/* specify that the network if is up */
	netif_set_up(echo_netif);

	IP4_ADDR(&(echo_netif->ip_addr),  192, 168,   1, 10);
	IP4_ADDR(&(echo_netif->netmask), 255, 255, 255,  0);
	IP4_ADDR(&(echo_netif->gw),      192, 168,   1,  1);

	print_ip_settings(&ipaddr, &netmask, &gw);

	/* start the application (web server, rxtest, txtest, etc..) */
	//run();

	/* receive and process packets */



	unsigned int arr[NUM_VALS];
	volatile register unsigned int temp_val;

	int state = 0;
	//int button_pressed = 0;

	//int count = 0;
	//unsigned int last_done = 0;

	while (1) {
		// stuff we need for network
		if (TcpFastTmrFlag) {
			tcp_fasttmr();
			TcpFastTmrFlag = 0;
		}
		if (TcpSlowTmrFlag) {
			tcp_slowtmr();
			TcpSlowTmrFlag = 0;
		}
		xemacif_input(echo_netif);
		// end network stuff

		// get from stream
		if (state == STATE_IDLE) {
			DemoRun();
			print("Waiting to read from stream...\n");
			/*for (int i = 0; i < NUM_VALS + 800; i++) {
				getfsl(temp_val, 1);
				//arr[i] = temp_val;
				xil_printf("%4x  %d\n", temp_val, i);
			}*/
			for (int i = 0; i < NUM_FFT_CHUNKS; i++) {
				getfsl(temp_val, 1);
				arr[i*NUM_FILTERS + 0] = temp_val;
				getfsl(temp_val, 2);
				arr[i*NUM_FILTERS + 1] = temp_val;
				getfsl(temp_val, 3);
				arr[i*NUM_FILTERS + 2] = temp_val;
				getfsl(temp_val, 4);
				arr[i*NUM_FILTERS + 3] = temp_val;
				getfsl(temp_val, 5);
				arr[i*NUM_FILTERS + 4] = temp_val;
				getfsl(temp_val, 6);
				arr[i*NUM_FILTERS + 5] = temp_val;
				getfsl(temp_val, 7);
				arr[i*NUM_FILTERS + 6] = temp_val;
				getfsl(temp_val, 8);
				arr[i*NUM_FILTERS + 7] = temp_val;
				getfsl(temp_val, 9);
				arr[i*NUM_FILTERS + 8] = temp_val;
				getfsl(temp_val, 10);
				arr[i*NUM_FILTERS + 9] = temp_val;
				getfsl(temp_val, 11);
				arr[i*NUM_FILTERS + 10] = temp_val;
				getfsl(temp_val, 12);
				arr[i*NUM_FILTERS + 11] = temp_val;
				getfsl(temp_val, 13);
				arr[i*NUM_FILTERS + 12] = temp_val;
			}
			//for (int i = 0; i < NUM_VALS; i++) {
			//	xil_printf("%8x  %d\n", arr[i], i);
			//}
			state = STATE_CONN_1_READY;
			print("Stream ended. Starting connection...\n");
		}

		if (state == STATE_CONN_1_READY) {
			state = STATE_CONN_1_WAIT;
			run(1, arr, &state);
		}

		if (state == STATE_CONN_2_READY) {
			state = STATE_CONN_2_WAIT;
			run(1, arr + (NUM_VALS / 6), &state);
			//run(1, arr + (NUM_VALS / 3), &state);
		}

		if (state == STATE_CONN_3_READY) {
			state = STATE_CONN_3_WAIT;
			run(1, arr + (2*NUM_VALS / 6), &state);
			//run(1, arr + (2*NUM_VALS / 3), &state);
		}

		if (state == STATE_CONN_4_READY) {
			state = STATE_CONN_4_WAIT;
			run(1, arr + (3*NUM_VALS / 6), &state);
		}

		if (state == STATE_CONN_5_READY) {
			state = STATE_CONN_5_WAIT;
			run(1, arr + (4*NUM_VALS / 6), &state);
		}

		if (state == STATE_CONN_6_READY) {
			state = STATE_CONN_6_WAIT;
			run(1, arr + (5*NUM_VALS / 6), &state);
		}

		if (state == STATE_CONN_7_READY) { // receive
			state = STATE_CONN_7_WAIT;
			for (int i = 0; i < 12288; i++) {
				tommy[i] = 0;
			}
			DemoRun();
			run(2, (unsigned int *) tommy, &state);
		}


		/*for (int i = 0; i < NUM_VALS; i++) {
			xil_printf("val%d = %08u\n", i, arr[i]);
		}*/

		/*getfsl(val1, 1);
		xil_printf("val1-%d:%06u\n", count, val1);*/

		//xil_printf("val%d:%06u\tval%d:%06u\tval%d:%06u\tval%d:%06u\tcount:%d\n",0,val0,1,val1,2,val2,3,val3,count++);

		/*if (((*ADDR_BTN_U) & 1)) {
			button_pressed = 1;
		}

		if (button_pressed) {
			SLEEP
			volatile unsigned int done = *ADDR_MIC_DONE;
			if (done != last_done) {
				arr[count] = (unsigned char) *ADDR_MIC_DATA;
				count++;
				last_done = done;
			}

			if (count >= NUM_VALS) {
				button_pressed = 0;
				count = 0;
				run(1, arr);
			}
		}*/
	}
  
	/* never reached */
    DemoCleanup();
	cleanup_platform();

	return 0;
}




void DemoInitialize() {
   EnableCaches();
   OLEDrgb_begin(&oledrgb, XPAR_PMODOLEDRGB_0_AXI_LITE_GPIO_BASEADDR,
         XPAR_PMODOLEDRGB_0_AXI_LITE_SPI_BASEADDR);
}

void DemoRun() {
   OLEDrgb_DrawBitmap(&oledrgb, 0, 0, 95, 63, (u8*) tommy);
}

void DemoCleanup() {
   DisableCaches();
}

void EnableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheEnable();
#endif
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheEnable();
#endif
#endif
}

void DisableCaches() {
#ifdef __MICROBLAZE__
#ifdef XPAR_MICROBLAZE_USE_DCACHE
   Xil_DCacheDisable();
#endif
#ifdef XPAR_MICROBLAZE_USE_ICACHE
   Xil_ICacheDisable();
#endif
#endif
}

