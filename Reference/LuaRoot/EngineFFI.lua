
local function Load()
	if not LuaTinker then
		print( "LuaTinker has't been initialized!" )
		return
	end

	LuaTinker.Using( 'UnityEngine' )
	LuaTinker.Using( 'System' )
	--LuaTinker.Using( 'Common' )
	LuaTinker.Using( 'FGDKit.Core' )
	--LuaTinker.Using( 'UniScene' )
	--LuaTinker.Using( 'GwScene' )
	--LuaTinker.Using( 'GwScene.Cutscene' )

	if USE_NATIVE_LUA then
		LuaTinker.Using( 'NativeLua' )
	else
		LuaTinker.Using( 'UniLuax' )
	end
	--LuaTinker.DefineEnum( "UnityEngine.RuntimePlatform" )
	--LuaTinker.DefineEnum( "UnityEngine.ThreadPriority" )

	Application_mt = LuaTinker.DefineClass( "UnityEngine.Application" )
		:sprop( "bool isEditor" )
		:sprop( "string dataPath" )
		--:sprop( "bool isMobilePlatform" )
		--:sprop( "RuntimePlatform platform" )
		--:sprop( "string streamingAssetsPath" )
		--:sprop( "string persistentDataPath" )
		--:smethod( "void OpenURL( string url )" )
	:EndDefine()

	AssetManager_mt = LuaTinker.DefineClass( "AssetManager" )
		:sprop( "AssetManager sharedInstance" )
		--:method( "bool SetImmortal( string assetPath, bool enable )" )
		:method( "bool Preload( string assetPath, bool immortal )" )
	:EndDefine()
	
	--[[
	ScriptManager_mt = LuaTinker.DefineClass( "ScriptManager" )
		:sprop( "ScriptManager sharedInstance" )
		:method( "int RunFile( String filePath )" )
		:method( "bool IsAlive( int id )" )
		:method( "bool Close( int id )" )
	:EndDefine()
	
	LuaFunctor_mt = LuaTinker.DefineClass( "LuaFunctor" )
	:EndDefine()

	GameObject_mt = LuaTinker.DefineClass( "UnityEngine.GameObject" )
		:ctor( "String" )
		:prop( "String name" )
		:method( "void SetActive( bool )" )
		:method( "UnityEngine.Component AddComponent( string className )" )
		:smethod( "UnityEngine.GameObject Find(string  name)" )
	:EndDefine()

	Vector2_mt = LuaTinker.DefineClass( "UnityEngine.Vector2" )
		:ctor( "float, float" )
		:field( "float x" )
		:field( "float y" )
	:EndDefine()

	Vector3_mt = LuaTinker.DefineClass( "UnityEngine.Vector3" )
		:ctor( "float, float" )
		:ctor( "float, float, float" )
		:field( "float x" )
		:field( "float y" )
		:field( "float z" )
	:EndDefine()

	Quaternion_mt = LuaTinker.DefineClass( "UnityEngine.Quaternion" )
		:ctor( "float, float, float, float" )
		:field( "float x" )
		:field( "float y" )
		:field( "float z" )
		:field( "float w" )
	:EndDefine()

	Object_mt = LuaTinker.DefineClass( "UnityEngine.Object" )
		:prop( "String name" )
	:EndDefine()

	Component_mt = LuaTinker.DefineClass( "UnityEngine.Component" )
		:base( "UnityEngine.Object" )
		:prop( "Transform transform" )
		:prop( "GameObject gameObject" )
		:prop( "bool active" )
		:method( "Component GetComponent( string )" )
		:method( "void SendMessage( string )" )
	:EndDefine()

	Transform_mt = LuaTinker.DefineClass( "UnityEngine.Transform" )
		:base( "UnityEngine.Component" )
		:prop( "GameObject gameObject" )
		:prop( "int childCount" )
		:prop( "Vector3 eulerAngles" )
		:prop( "Vector3 forward" )
		:prop( "bool hasChanged" )
		:prop( "Vector3 localEulerAngles" )
		:prop( "Vector3 localPosition" )
		:prop( "Quaternion localRotation" )
		:prop( "Vector3 localScale" )
		:prop( "Vector3 lossyScale" )
		:prop( "Transform parent" )
		:prop( "Vector3 position" )
		:prop( "Vector3 right" )
		:prop( "Transform root" )
		:prop( "Quaternion rotation" )
		:prop( "Vector3 up" )
		:method( "void DetachChildren()" )
		:method( "Transform Find( string a )" )
		:method( "Transform FindChild( string )" )
		:method( "Transform GetChild( int )" )
		:method( "void LookAt( Transform )" )
	:EndDefine()

	Behaviour_mt = LuaTinker.DefineClass( "UnityEngine.Behaviour" )
		:base( "UnityEngine.Component" )
		:prop( "bool enabled" )
	:EndDefine()

	MonoBehaviour_mt = LuaTinker.DefineClass( "UnityEngine.MonoBehaviour" )
		:base( "UnityEngine.Behaviour" )
	:EndDefine()

	LuaBehaviour_mt = LuaTinker.DefineClass( "Common.LuaBehaviour" )
		:base( "UnityEngine.MonoBehaviour" )
		:prop( "String sourcePath" )
	:EndDefine()

	Camera_mt = LuaTinker.DefineClass( "UnityEngine.Camera" )
		:base( "UnityEngine.Behaviour" )
	:EndDefine()

	AnimEventDispatcher_mt = LuaTinker.DefineClass( "AnimEventDispatcher" )
		:method( "void ClearAllSigSlots()" )
		:method( "object AddEventHandler_ActionBegin( LuaFunctor )" )
		:method( "bool RemoveEventHandler_ActionBegin( object function )" )
		:method( "object AddEventHandler_ActionEnd( LuaFunctor )" )
		:method( "bool RemoveEventHandler_ActionEnd( object function )" )
		:method( "object AddEventHandler_Missile( LuaFunctor )" )
		:method( "bool RemoveEventHandler_Missile( object function )" )
		:method( "object AddEventHandler_Hit( LuaFunctor )" )
		:method( "bool RemoveEventHandler_Hit( object function )" )
		:method( "object AddEventHandler_BladeBegin( LuaFunctor )" )
		:method( "bool RemoveEventHandler_BladeBegin( object function )" )
		:method( "object AddEventHandler_ActionBegin( LuaFunctor )" )
		:method( "bool RemoveEventHandler_ActionBegin( object function )" )
		:method( "object AddEventHandler_ActionBegin( LuaFunctor )" )
		:method( "bool RemoveEventHandler_ActionBegin( object function )" )
	:EndDefine()

	Entity_mt = LuaTinker.DefineClass( "Entity" )
		:prop( "Vector3 position" )
		:prop( "Vector2 position2d" )
		:prop( "UInt64 code" )
		:prop( "float facing" )
		:prop( "int layer" )
		:prop( "GameObject gameObject" )
		:prop( "Transform transform" )
		:prop( "int layer" )
		:prop( "AnimEventDispatcher animationEventDispatcher" )
		:method( "void RayCastToGround( Vector3 )" )
		:method( "void RayCastToGroundXOZ( Vector2 )" )
		:method( "void SetPosition( Vector3 )" )
		:method( "void SetTargetPosition2d( Vector2 ,bool )", "SetTargetPosition2d" )
		:method( "void SetTargetPosition( Vector3 ,bool )" )
	:EndDefine()

	LuaTinker.DefineEnum( "Camp" )
	LuaTinker.DefineEnum( "Career" )

	local Character_mt = LuaTinker.DefineClass( "Character" )
		:base( "Entity" )
		:method( "bool RunASMCmd( String )" )
	:EndDefine()

	Player_mt = LuaTinker.DefineClass( "Player" )
		:base( "Character" )
		:method( "int GetProp_Level()" )
		:method( "int GetProp_HpPercent()" )
		:method( "String GetProp_Name()" )
		:method( "String GetProp_RoleID()" )
		:method( "Career GetProp_Career()" )
	:EndDefine()

	LocalPlayer_mt = LuaTinker.DefineClass( "LocalPlayer" )
		:base( "Player" )
		:method( "void EnableUserInput( bool )" )
		:method( "void Freeze( float )" )
		:method( "void UnFreeze()" )
		:method( "bool IsInDeadZone()" )
	:EndDefine()

	RemotePlayer_mt = LuaTinker.DefineClass( "RemotePlayer" )
		:base( "Player" )
	:EndDefine()

	CameraController_mt = LuaTinker.DefineClass( "UniScene.CameraController" )
	:EndDefine()

	BaseScene_mt = LuaTinker.DefineClass( "BaseScene" )
		:prop( "String name" )
		:prop( "Camera camera" )
		:method( "void EnableSceneObjects( bool )" )
		:smethod( "Vector3 GetTerrainPosition( float, float )" )
	:EndDefine()

	PlayerActor_mt = LuaTinker.DefineClass( "GwScene.Cutscene.PlayerActor" )
		:base( "Player" )
	:EndDefine()

	NpcActor_mt = LuaTinker.DefineClass( "GwScene.Cutscene.NpcActor" )
		:base( "Character" )
	:EndDefine()

	MonsterActor_mt = LuaTinker.DefineClass( "GwScene.Cutscene.MonsterActor" )
		:base( "Character" )
	:EndDefine()

	Scene_mt = LuaTinker.DefineClass( "Scene" )
		:base( "BaseScene" )
		:method( "LocalPlayer GetLocalPlayer()" )
		:method( "void PrintMapInfo()" )
		:method( "void EnableCamera( bool )" )
		:method( "void ShowEntities( bool )" )
		:method( "void ShowLocalPlayer( bool )" )
		:method( "int DoCameraShake( int id )" )
		:smethod( "CameraController GetCameraControl()" )
		:method( "int RunScript( String fileName )" )
	:EndDefine()

	WorldState_mt = LuaTinker.DefineClass( "WorldState" )
		:sprop( "Scene activeScene" )
	:EndDefine()

	UIScene_mt = LuaTinker.DefineClass( "UIScene" )
		:base( "MonoBehaviour" )
	:EndDefine()

	UIManager_mt = LuaTinker.DefineClass( "UIManager" )
		:method( "bool CloseScene( UIScene, bool play )" )
		:method( "void CloseAllScene( bool reset )" )
	:EndDefine()

	UnityUtils_mt = LuaTinker.DefineClass( "UnityUtils" )
		:smethod( "GameObject ResetTransform( GameObject )" )
		:smethod( "void CopyTransform( Transform, Transform )" )
		:smethod( "Transform Reset( Transform )" )
		:smethod( "Transform GetChildByName( Transform, String )" )
		:smethod( "Transform FindParent( Transform, Transform )" )
		:smethod( "String GetHierarchyPath( Transform )" )
		:smethod( "Transform Find( String )" )
		:smethod( "Transform RequireChildTransform( Transform, String )" )
		:smethod( "Transform SearchHierarchy( Transform, String, bool )" )
		:smethod( "Transform GetParentTrans( Transform, String )" )
	:EndDefine()

	VFXPreLoader_mt = LuaTinker.DefineClass( "GwScene.VFXPreLoader" )
		:smethod( "void AsyncRequireLoad( string resourcesPath )" )
	:EndDefine()

	PlayerModelPathGroup_mt = LuaTinker.DefineClass( "GwScene.ModelPathMan+PlayerModelPathGroup" )
		:field( "String baseMaleBodyPath" )
		:field( "String baseFemaleBodyPath" )
	:EndDefine()

	ModelPathMan_mt = LuaTinker.DefineClass( "GwScene.ModelPathMan" )
		:smethod( "GwScene.ModelPathMan+PlayerModelPathGroup GetPlayerModelPathGroup( int index )" )
		:smethod( "void AsyncRequireLoadForLua( string resourcesPath )" )
	:EndDefine()

	Resolution_mt = LuaTinker.DefineClass( "UnityEngine.Resolution" )
		:prop( "int width" )
		:prop( "int height" )
	:EndDefine()

	Screen_mt = LuaTinker.DefineClass( "UnityEngine.Screen" )
		:sprop( "Resolution currentResolution" )
	:EndDefine()

	UIHelps_mt = LuaTinker.DefineClass( "Common.CommonHelper.UIHelps" )
		:smethod( "void SetUIRootContentSize( int width, int height )" )
	:EndDefine()

	USCutscene_mt = LuaTinker.DefineClass( "GwScene.USCutscene" )
		:sprop( "USCutscene sharedInstance" )
		:prop( "bool isLoading" )
		:prop( "string sourceFileName" )
		:prop( "bool isLoaded" )
		:prop( "bool isPlaying" )
		:method( "bool Load( string name )" )
		:method( "void Unload()" )
		:method( "void Play()" )
		:method( "void Stop()" )
		:method( "void OpenDialogBox( int id, bool pause )" )
		:method( "void CloseDialogBox()" )
		:method( "void IdleAllActors" )
		:method( "Transform FindActor( String path )" )
	:EndDefine()

	ShadowRenderer_mt = LuaTinker.DefineClass( "ShadowRenderer" )
		:sprop( "bool valid" )
		:sprop( "ShadowRenderer sharedInstance" )
		:method( "void SetDebugMode" )
	:EndDefine()
	--]]
end

local function DumpLinkXML()
	local types = LuaTinker.ListAllCachedType()
	local sb = {}
	local append = function( s )
		sb[#sb + 1]  = s
	end
	append( "<linker>" )
	for k, v in pairs( types ) do
		local _k = k
		local d = string.find( k, ',' )
		if d ~= nil then
			_k = string.sub( k, 1, d - 1 )
		end
		append( string.format( "\t<assembly fullname=\"%s\">", _k ) )
		for _, n in ipairs( v ) do
			append( string.format( "\t\t<type fullname=\"%s\" preserve=\"all\"/>", n ) )
		end
		append( "\t</assembly>" )
	end
	append( "</linker>" )
	local ret = table.concat( sb, '\n' )
	print( ret )
	return ret
end

return {
	Load = function ()
		Load()
		if USE_NATIVE_LUA then
			local Application = UnityEngine.Application.__static_instance
			if Application.isEditor then
				local link = DumpLinkXML()
				local fn = Application.dataPath.."/link.xml"
				print( "save link.xml to: "..fn )
				local f = io.open( fn, "w" )
				f:write( link )
				f:close()
			end
		end
	end,
}
