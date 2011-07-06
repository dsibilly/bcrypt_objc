#import "MABCrypt.h"
#import "macros.h"
#import "bcrypt/bcrypt.h"

@interface MABCrypt (PrivateMethods)

+ (BOOL)isLegacyHash:(NSString*)hash;

@end


@implementation MABCrypt

+ (NSString*)hash:(NSString*)password
{
	return [MABCrypt hash:password workFactor:kDefaultWorkFactor];
}


+ (NSString*)hash:(NSString*)password workFactor:(NSUInteger)workFactor
{
	if (workFactor < 4 || workFactor > 31)
		workFactor = kDefaultWorkFactor;
	
	char salt[BCRYPT_HASHSIZE];
	char hash[BCRYPT_HASHSIZE];
	
	NSAssert(bcrypt_gensalt(workFactor, salt) == 0, @"Error generating Blowfish salt");
	NSAssert(bcrypt_hashpw([password cStringUsingEncoding:[NSString defaultCStringEncoding]], salt, hash) == 0, @"Error generating BCrypt hash");
	return [NSString stringWithCString:hash 
	                          encoding:[NSString defaultCStringEncoding]];
}


+ (BOOL)check:(NSString*)password
   storedHash:(NSString*)storedHash
{
	return [MABCrypt check:password storedHash:storedHash legacyHandler:nil];
}


+ (BOOL)check:(NSString*)password
        storedHash:(NSString*)storedHash
     legacyHandler:(LegacyHandler)legacyHandler
{
	if ([MABCrypt isLegacyHash:storedHash]) {
		if (legacyHandler != nil) {
			return legacyHandler(password, storedHash);
		 } else
			NSAssert(NO, @"Unsupported hash format");
	}
	return [[MABCrypt hash:password workFactor:kDefaultWorkFactor] isEqualToString:storedHash];
}


+ (BOOL)isLegacyHash:(NSString*)hash
{
	return (! [[hash substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"$2a$"]);
}

@end