#import "BCryptApp.h"
#import "MABCrypt.h"

@interface BCryptApp (PrivateMethods)

- (void)printHelp;
- (void)printVersion;
- (void)printUsage:(FILE*)stream;

@end

@implementation BCryptApp

- (void)application:(DDCliApplication*)application
   willParseOptions:(DDGetoptLongParser*)optionsParser
{
	DDGetoptOption optionTable[] =
	{
		// Long			Short			Argument options
		{@"version",	0,					DDGetoptNoArgument},
		{@"help",			'h', 				DDGetoptNoArgument},
		{nil,					0,					0},
	};
	[optionsParser addOptionsFromTable:optionTable];	
}


- (int)application:(DDCliApplication*)application
  runWithArguments:(NSArray*)arguments
{
	if (_help) {
		[self printHelp];
		return EXIT_SUCCESS;
	}
	
	if (_version) {
		[self printVersion];
		return EXIT_SUCCESS;
	}
	
	if ([arguments count] < 1) {
		ddfprintf(stderr, @"%@: You must supply a password to hash\n", DDCliApp);
		[self printUsage:stderr];
		ddfprintf(stderr, @"Try `%@ --help` for more information.\n", DDCliApp);
		return EX_USAGE;
	}
	
	NSString *hash = [MABCrypt hash:[arguments objectAtIndex:0]];
	ddprintf([NSString stringWithFormat:@"%@\n", hash]);
	return EXIT_SUCCESS;
}

@end


@implementation BCryptApp (PrivateMethods)

- (void)printUsage:(FILE*)stream
{
	ddfprintf(stream, @"%@: Usage [OPTIONS] <argument> [...]\n", DDCliApp);
}


- (void)printHelp
{
	[self printUsage:stdout];
	printf("\n"
				 "  -p, --passwd FOO\tGenerate bcrypt hash for password FOO\n"
				 "      --version\t\tDisplay version and exit\n"
				 "  -h, --help\t\tDisplay this help and exit\n"
				 "\n"
				 "Generates a bcrypt hash for a given password.\n");
}


- (void)printVersion
{
	ddprintf(@"%@ version %@\n", DDCliApp, CURRENT_MARKETING_VERSION);
}

@end