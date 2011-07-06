#import <Foundation/Foundation.h>
#import "DDCli/DDCommandLineInterface.h"
#import "BCryptApp.h"

int main(int argc, const char* argv[])
{
	return DDCliAppRunWithClass([BCryptApp class]);
}