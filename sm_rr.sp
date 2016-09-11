#pragma semicolon 1
#pragma newdecls required

public Plugin pl_info = {
	author = "Hikka",
	name = "[SM] Round Restart",
	version = "0.01",
	url = "",
};

public void OnPluginStart() {
	RegAdminCmd("sm_rr", sm_rr, ADMFLAG_BAN, "Restart Round <time>");
}

public Action sm_rr(int client, int args) {
	if (client && IsClientInGame(client)) {
		if (args != 1) {
			ServerCommand("mp_restartgame 1");
			return Plugin_Handled;
		}
		
		char arg[12];
		GetCmdArg(1, arg, sizeof(arg));
		int time = StringToInt(arg);
		ServerCommand("mp_restartgame %i", time);
	}
	return Plugin_Handled;
}
		