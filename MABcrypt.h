/**
 MABCrypt
 Objective-C wrapper for bcrypt
 by Duane Sibilly <duane@sibilly.com>
 
 Uses Ricardo Garcia's bcrypt C library
 https://github.com/rg3/bcrypt
 
 Inspired by Marco Arment's PHP 5.3 bcrypt implementation
 https://gist.github.com/1053158
 
 Both the bcrypt C library used and the PHP implementation that inspired this
 work are in the public domain. This adaptation is also in the public domain.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OF OTHER DEALINGS IN THE SOFTWARE.
 */

#import <Foundation/Foundation.h>

// The work factor of bcrypt determines how expensive you wish this hash
// function to be. The higher it is, the longer it takes to compute (and thus
// the longer it takes to break).
#define kDefaultWorkFactor 12

// Block-based callbacks for +(BOOL)check:storedHash:legacyHandler
typedef BOOL (^LegacyHandler)(NSString*, NSString*);

@interface MABCrypt : NSObject

/**
 + (NSString*)hash:
 Generates a bcrypt hash for the given NSString using the default work factor
 
 password		- An NSString containing the plaintext password to be hashed.
 
 Returns an NSString containing the bcrypt cryptographic hash of the given password.
 */
+ (NSString*)hash:(NSString*)password;


/**
 + (NSString*)hash:workFactor:
 Generates a bcrypt hash for the given NSString using the given work factor
 
 password 	- An NSString containing the plaintext password to be hashed.
 workFactor - An NSUInteger representing the bcrypt work factor to be used.
 
 Returns an NSString containing the bcrypt cryptographic hash of the given password.
 */
+ (NSString*)hash:(NSString*)password workFactor:(NSUInteger)workFactor;


/**
 + (BOOL)check:againstHash:
 Checks a given password against a stored bcrypt hash.
 
 password 	- An NSString containing the plaintext password to be checked.
 storedHash - An NSString containing a pre-stored cryptographic hash.
 
 Returns YES if password's bcrypt hash matches storedHash; otherwise returns NO.
 */
+ (BOOL)check:(NSString*)password againstHash:(NSString*)storedHash;


/**
 + (BOOL)check:againstHash:withLegacyHandler:
 Checks a given password against a stored cryptographic hash with a fallback to
 a legacy hash comparison algorithm for use in security migrations.
 
 password 			- An NSString containing the plaintext password to be checked.
 storedHash			- An NSString containing a pre-stored cryptographic hash.
 legacyHandler 	- A callback block (see typedef above) for legacy cryptographic
                  hash functions.
 
 Returns YES if password's cryptographic hash (bcrypt or legacyHandler) matches
 storedHash; otherwise NO
 */
+ (BOOL)check:(NSString*)password againstHash:(NSString*)storedHash withLegacyHandler:(LegacyHandler)legacyHandler;

@end