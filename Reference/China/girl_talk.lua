local girl_talk = 
{
	{
		talkcontent = "@298607",
		talktype = 1
	},
	{
		anim = "dance",
		talksound = "girl_2",
		talktype = 1
	},
	{
		anim = "gift",
		talkcontent = "@85304",
		talksound = "girl_3",
		talktype = 1
	},
	{
		anim = "happy",
		talkcontent = "@390486",
		talksound = "girl_4",
		talktype = 1
	},
	{
		anim = "dance",
		talkcontent = "@262158",
		talksound = "girl_5",
		talktype = 1
	},
	{
		talkcontent = "@49686",
		talksound = "girl_6"
	},
	{
		talkcontent = "@447192",
		talksound = "girl_7"
	},
	{
		talkcontent = "@440982",
		talksound = "girl_8"
	},
	{
		talkcontent = "@328361",
		talksound = "girl_9"
	},
	{
		anim = "dance",
		talkcontent = "@175772",
		talksound = "girl_10"
	},
	{
		anim = "praise",
		talkcontent = "@184242",
		talksound = "girl_11",
		talktype = 3
	},
	{
		anim = "praise",
		talkcontent = "@237796",
		talksound = "girl_12",
		talktype = 3
	},
	{
		anim = "happy",
		talkcontent = "@156522",
		talksound = "girl_13",
		talktype = 3
	},
	{
		anim = "master",
		talkcontent = "@21599",
		talksound = "girl_14",
		talktype = 3
	},
	{
		anim = "happy",
		talkcontent = "@421047",
		talksound = "girl_15",
		talktype = 3
	},
	{
		anim = "sayHello",
		talkcontent = "@513158",
		talksound = "girl_16"
	},
	{
		anim = "gift",
		talkcontent = "@396915",
		talksound = "girl_17"
	},
	{
		anim = "gift",
		talkcontent = "@243822",
		talksound = "girl_18"
	},
	{
		anim = "happy",
		talkcontent = "@379949",
		talksound = "girl_19"
	},
	{
		anim = "sayHello",
		talkcontent = "@452835",
		talksound = "girl_20"
	},
	{
		anim = "sayHello",
		talkcontent = "@155372",
		talksound = "girl_21",
		talktype = 4
	},
	{
		anim = "master",
		talkcontent = "@465607",
		talksound = "girl_22",
		talktype = 4
	},
	{
		anim = "sayHello",
		talkcontent = "@448972",
		talksound = "girl_23",
		talktype = 4
	},
	{
		anim = "gift",
		talkcontent = "@464329",
		talksound = "girl_24",
		talktype = 4
	}
}
local __default_values = {
	anim = "angry",
	talkcontent = "@136248",
	talksound = "girl_1",
	talktype = 2
}
do
	local base = { __index = __default_values, __newindex = function() error( "Attempt to modify read-only table" ) end }
	for k, v in pairs( girl_talk ) do
		setmetatable( v, base )
	end
	base.__metatable = false
	setmetatable( girl_talk, { __default = __default_values, __hash = 0x712b5693, __masked = false } )
end

return girl_talk
