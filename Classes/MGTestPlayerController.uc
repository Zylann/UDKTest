class MGTestPlayerController extends UTPlayerController;

auto state NormalState
{
	/*
	 * The function called when the user presses the fire key (left mouse button by default)
	 */
	exec function StartFire( optional byte FireModeNum )
	{
		`log("Test");
	}
}

