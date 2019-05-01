#include <stdio.h>

int verify_key(char *str){
	char key[5] = "HODOR";
	
	for(int i=0; i<5; i++){
		if (str[i]!=key[i]){
			printf("Key is not valid :(\n");
			return 0;
		}
	}
	printf("Key is valid! Whoop whoop :)\n");
	return 0;
}

int main(){
	char str[5];
	
	printf("Enter serial (5 capital letters): ");
	scanf("%s", str);
	
	for(int i=0; i<5; i++){
		str[i]=str[i]+i;
	}
	
	return verify_key(str);
}

