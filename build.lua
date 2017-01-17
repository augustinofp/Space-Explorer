-- Supported values for orientation
-- portrait, protraitUpsideDown, landscapeLeft, lanscapeRight
settings =
{
		orientation = 
		{
			default = "portrait"
		},

		android =
			{
				usesPermissions =
				{
				},
			},

		iphone = 
		{
			plist = 
			{
				UIAppFonts = {"SF Automation.ttf"},
				UIStatusBarHidden=true,
				UIViewControllerBasedStatusBarAppearance = false,
				UIApplicationExitOnSuspend = false,
				UIPrerenderedIcon = true
			},
		},

		plugins =
			{

			},	
}