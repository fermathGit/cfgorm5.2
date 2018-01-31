local print = print

print( 'LuaBehaviour.lua loaded.' )

function Awake()
	print( 'Awake' )
end

function Start()
	print( 'Start' )
end

function Update()
end

function OnEnable()
	print( 'OnEnable' )
end

function OnDisable()
	print( 'OnDisable' )
end

function OnDestroy()
	print( 'OnDestroy' )
end
