//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "Three20UI/TTButtonContent.h"

// UI
#import "Three20UI/TTButton.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTButtonContent

@synthesize title     = _title;
@synthesize imageURL  = _imageURL;
@synthesize image     = _image;
@synthesize style     = _style;
@synthesize delegate  = _delegate;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithButton:(TTButton*)button {
  if ((self = [super init])) {
    _button = button;
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_title);
  TT_RELEASE_SAFELY(_imageURL);
  TT_RELEASE_SAFELY(_image);
  TT_RELEASE_SAFELY(_style);
  self.delegate = nil;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setImageURL:(NSString*)URL {
  if (self.image && _imageURL && [URL isEqualToString:_imageURL])
    return;
    
    URL = [URL stringByDeletingPathExtension];
  _imageURL = URL;
_image = [UIImage imageNamed:URL];
  if (_imageURL.length) {
      _image = [UIImage imageNamed:URL];
  } else {
    self.image = nil;
    [_button setNeedsDisplay];
  }
}

@end

