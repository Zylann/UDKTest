class MGTestFlashlight extends UTWeapon;

var SpotLightComponent spotLight;

simulated function DrawWeaponCrosshair( Hud H )
{
	local float crosshairSize;

	// Draw a crosshair

	crosshairSize = 4;

	// Horizontal line
	H.Canvas.SetPos(H.centerX - crosshairSize, H.centerY);
	H.Canvas.DrawRect(2*crosshairSize+1, 1);
	// Vertical line
	H.Canvas.SetPos(H.centerX, H.centerY - crosshairSize);
	H.Canvas.DrawRect(1, 2*crosshairSize+1);
}

simulated state WeaponEquipping
{
	simulated function BeginState( Name PreviousStateName )
	{
		super.BeginState(PreviousStateName);
		`log("Equipping flashlight");
		spotLight.SetEnabled(true);
	}
}

simulated state Active
{
	simulated function BeginFire( Byte FireModeNum )
	{
		super.BeginFire(FireModeNum);
		spotLight.SetEnabled(!spotLight.bEnabled);
	}
}

simulated state WeaponPuttingDown
{
	simulated function BeginState( Name PreviousStateName )
	{
		spotLight.SetEnabled(false);
		super.BeginState(PreviousStateName);
	}
}

DefaultProperties
{
	// First person appearance
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WP_LinkGun.Mesh.SK_WP_Linkgun_1P'
		AnimSets(0)=AnimSet'WP_LinkGun.Anims.K_WP_LinkGun_1P_Base'
		//Animations=MeshSequenceA
		Scale=0.9 // the original has a scale of 0.9
		FOV=60.0
	End Object
	PlayerViewOffset=(X=30.0,Y=0,Z=-15.0) // the original is at (X=10.0,Y=15,Z=-15.0)
	Mesh=FirstPersonMesh

	// Pickup appearance
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_LinkGun.Mesh.SK_WP_LinkGun_3P'
	End Object

	// Spotlight
	Begin Object Class=SpotLightComponent Name=MySpotLight
	End Object
	Components.Add(MySpotLight)
	spotLight=MySpotLight

	FireInterval(0)=0.1;
	ShotCost(0)=0 // the flashlight has an infinite battery 
	AmmoCount=100
    MaxAmmoCount=100

	WeaponFireTypes(0)=EWFT_InstantHit
	WeaponFireTypes(1)=EWFT_None
}
