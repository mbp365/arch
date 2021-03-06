/* Patches included :
 * 1) Notitle
 * 2) pertag
 * 3) dwfifo (didnt work) */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class          instance    title       tags mask     isfloating   monitor */
	{ "Gimp",         NULL,       NULL,       0,            1,           -1 },
	{ "qutebrowser",  NULL,       NULL,       1 << 8,       0,           -1 },
	{ NULL,           NULL,       "Discord",  1 << 7,       0,           -1 },
	{ NULL,           NULL,       "telegram", 1 << 7,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "><>",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define term "st"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { term, NULL };
static const char *filebrowsercmd[]  = { term, "-e", "ranger", NULL };
static const char *newsboat[]  = { term, "-e", "newsboat", NULL };
static const char *browsercmd[]  = { "qutebrowser", NULL };
static const char *printWholeScreen[]  = { "bash", "/home/max/.scripts/print_screens/print_whole_screen.sh", NULL };
static const char *printSelection[]  = { "bash","/home/max/.scripts/print_screens/print_selection.sh", NULL };
static const char *music[]  = { term, "-e", "ncmpcpp", NULL };
static const char *screenLock[]  = { "i3lock-fancy", "&&", "systemctl", "suspend", NULL };

static const char *volumeUp[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL};
static const char *volumeDown[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL};
static const char *volumeMute[] = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL};
static const char *micMute[] = { "pactl", "set-source-mute", "@DEFAULT_SOURCE@", "toggle", NULL};

static const char *musicToggle[] = {"mpc", "toggle", NULL};
static const char *musicNext[] = {"mpc", "next", NULL};
static const char *musicPrev[] = {"mpc", "prev", NULL};
static const char *musicBack[] = {"mpc", "seek", "-10", NULL};
static const char *musicForward[] = {"mpc", "seek", "+10", NULL};

static const char *screencapStart[]  = { "bash", "/home/max/.scripts/screencap/start.sh", NULL };
static const char *screencapStop[]  = { "bash", "/home/max/.scripts/screencap/stop.sh", NULL };

static Key keys[] = {
	/* modifier           key        function        argument */
	{ MODKEY,             XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,             XK_b,      spawn,          {.v = browsercmd} },
	{ MODKEY,             XK_n,      spawn,          {.v = filebrowsercmd} },
	{ MODKEY,             XK_w,      spawn,          {.v = newsboat} },
	{ MODKEY,             XK_Print,  spawn,          {.v = printSelection } },
	{ 0,                  XK_Print,  spawn,          {.v = printWholeScreen } },
	{ MODKEY,             XK_m,      spawn,          {.v = music } },
	{ MODKEY,             XK_F1,     spawn,          {.v = screenLock} },
	{ MODKEY,             XK_F7,     spawn,          {.v = screencapStart} },
	{ MODKEY|ShiftMask,   XK_F7,     spawn,          {.v = screencapStop} },

	{ 0,                  XF86XK_AudioRaiseVolume,     spawn,     {.v = volumeUp } },
	{ 0,                  XF86XK_AudioLowerVolume,     spawn,     {.v = volumeDown } },
	{ 0,                  XF86XK_AudioMute,            spawn,     {.v = volumeMute } },
	{ 0,                  XF86XK_AudioMicMute,         spawn,     {.v = micMute } },

	{ MODKEY,             XK_End,     spawn,     {.v = musicToggle } },
	{ MODKEY|ShiftMask,   XK_Left,    spawn,     {.v = musicNext } },
	{ MODKEY|ShiftMask,   XK_Right,   spawn,     {.v = musicPrev } },
	{ MODKEY,             XK_Left,    spawn,     {.v = musicBack } },
	{ MODKEY,             XK_Right,   spawn,     {.v = musicForward } },

    { MODKEY|ShiftMask,   XK_Return, zoom,           {0} },
	{ MODKEY,             XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,             XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,             XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,   XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,             XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,             XK_Tab,    view,           {0} },
	{ MODKEY,             XK_q,      killclient,     {0} },
	{ MODKEY,             XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,             XK_f,      setlayout,      {0} },
	{ MODKEY,             XK_space,  togglefloating, {0} },
	{ MODKEY,             XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,             XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,   XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,   XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(              XK_1,                      0)
	TAGKEYS(              XK_2,                      1)
	TAGKEYS(              XK_3,                      2)
	TAGKEYS(              XK_4,                      3)
	TAGKEYS(              XK_5,                      4)
	TAGKEYS(              XK_6,                      5)
	TAGKEYS(              XK_7,                      6)
	TAGKEYS(              XK_8,                      7)
	TAGKEYS(              XK_9,                      8)
	{ MODKEY|ShiftMask,   XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

