//JS
defineClass("BBC2CMarketProductDetailViewController", {
  //instance method definitions

	followMe:function(isFollow) {
        require('BBCtcUserFollowService');
            
		var _followService = self.followService();
		if (!_followService) {
	        _followService = BBCtcUserFollowService.alloc().init();
            self.setFollowService(_followService);
	    }
            
	    self.ORIGfollowMe(isFollow);
	}

})