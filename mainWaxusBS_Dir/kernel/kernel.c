void kernel_main(){
	const char* output = "WaxusBS has been loaded succesfully";
	char* video_memory = (char *) 0xB8000;
	
	//video_memory[0]='T';
	//video_memory[1]=0x07;
	
	for (int i = 0; output[i]!='\0'; i++) {
		video_memory[i*2]=output[i];
		video_memory[i*2+1]=0x07;
	}

	while(1) {} //infinite loop
}

//kernel_main()
