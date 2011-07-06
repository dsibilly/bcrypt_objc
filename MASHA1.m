#import "SHA1.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SHA1

+ (NSString*)digest:(NSString*)input
{
	// Craig Spitzkoff's original implementation used UTF8. Since PHP's SHA-1
	// implementation is ASCII-based, we're using NSASCIIStringEncoding instead
	// See: http://spitzkoff.com/craig/?p=122#comment-389
	NSData *data = [input dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	uint8_t digest[CC_SHA1_DIGEST_LENGTH];
	
	CC_SHA1(data.bytes, data.length, digest);
	
	NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
	
	for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i += 1) {
		[output appendFormat:@"%02x", digest[i]];
	}
	return output;
}

@end