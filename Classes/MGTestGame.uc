class MGTestGame extends UTGame;

event PostLogin(PlayerController player)
{
	super.PostLogin(player);
	player.ClientMessage("Hello player '" $ player.PlayerReplicationInfo.PlayerName $ "'!");
}


DefaultProperties
{
	PlayerControllerClass = class'MGTestPlayerController'
}
