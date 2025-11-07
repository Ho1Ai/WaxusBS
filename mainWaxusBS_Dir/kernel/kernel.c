//#include ""

#define TEST_KBD_DATA_PORT 0x60

typedef unsigned int uint32_t;


// char definers
char* video_memory = (char *) 0xB8000;

// int definers
int carrette_position_column = 0; // 1st column has index 0;
int carrette_position_row = 0; // 1st row has index 0;



void clearScreen() {
	for (int i = 0; i < 80*25*2; i+=2) {
		video_memory[i] = ' ';
		video_memory[i+1] = 0x05;
		}
	}

void outputString(const char* message){
	for (int i = 0; message[i] != '\0'; i++) {
		video_memory[i*2] = message[i];
		video_memory[i*2+1] = 0x07;
		}
	}

void kernel_main(){
	const char* output = "WaxusBS has been loaded succesfully";

	//video_memory[0]='T';
	//video_memory[1]=0x07;
	
	for (int i = 0; i < 80*25*2; i+=2) {
		video_memory[i] = ' ';
		video_memory[i+1] = 0x07;
	}

	for (int i = 0; output[i]!='\0'; i++) {
		video_memory[i*2]=output[i];
		video_memory[i*2+1]=0x07;
	}

	clearScreen();
	outputString(output);

	// organize base function for keyboard reading

	int curr_input_buffer = 0;

	while(1) { // temporarily it is here. After all main job done I'll place it in diff file
		asm volatile("");
		}

	while(1) {} //infinite loop
}

//kernel_main()
