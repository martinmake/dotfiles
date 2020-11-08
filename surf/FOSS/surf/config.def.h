/* modifier 0 means no modifier */
static int surfuseragent    = 1;  /* Append Surf version to default WebKit user agent */
static char *fulluseragent  = ""; /* Or override the whole user agent string */
static char *styledir       = "~/.surf/styles/";
static char *certdir        = "~/.surf/certificates/";
static char *cachedir       = "~/.surf/cache/";
static char *cookiefile     = "~/.surf/cookies.txt";
static char *historyfile    = "~/.surf/history.txt";
static char *searchurl      = "duckduckgo.com/?q=%s";
static char *dldir          = "~/downloads/";
static char *dlstatus       = "~/.surf/dlstatus/";
static char *scriptfiles[]  = {
	// "~/.surf/scripts/xxx.js",
};

/* Webkit default features */
/* Highest priority value will be used.
 * Default parameters are priority 0
 * Per-uri parameters are priority 1
 * Command parameters are priority 2
 */
static Parameter defconfig[ParameterLast] = {
	/* parameter                    Arg value       priority */
	[AcceleratedCanvas]   =       { { .i = 1 },     },
	[AccessMicrophone]    =       { { .i = 1 },     },
	[AccessWebcam]        =       { { .i = 1 },     },
	[Certificate]         =       { { .i = 0 },     },
	[CaretBrowsing]       =       { { .i = 0 },     },
	[CookiePolicies]      =       { { .v = "@Aa" }, },
	[DefaultCharset]      =       { { .v = "UTF-8" }, },
	[DiskCache]           =       { { .i = 1 },     },
	[DNSPrefetch]         =       { { .i = 1 },     },
	[FileURLsCrossAccess] =       { { .i = 0 },     },
	[FontSize]            =       { { .i = 12 },    },
	[FrameFlattening]     =       { { .i = 0 },     },
	[Geolocation]         =       { { .i = 0 },     },
	[HideBackground]      =       { { .i = 1 },     },
	[Inspector]           =       { { .i = 0 },     },
	[Java]                =       { { .i = 1 },     },
	[JavaScript]          =       { { .i = 1 },     },
	[KioskMode]           =       { { .i = 0 },     },
	[LoadImages]          =       { { .i = 1 },     },
	[MediaManualPlay]     =       { { .i = 1 },     },
	[Plugins]             =       { { .i = 1 },     },
	[PreferredLanguages]  =       { { .v = (char *[]){ NULL } }, },
	[RunInFullscreen]     =       { { .i = 0 },     },
	[ScrollBars]          =       { { .i = 0 },     },
	[ShowIndicators]      =       { { .i = 1 },     },
	[SiteQuirks]          =       { { .i = 1 },     },
	[SmoothScrolling]     =       { { .i = 1 },     },
	[SpellChecking]       =       { { .i = 1 },     },
	[SpellLanguages]      =       { { .v = ((char *[]){ "en_US", NULL }) }, },
	[StrictTLS]           =       { { .i = 1 },     },
	[Style]               =       { { .i = 1 },     },
	[WebGL]               =       { { .i = 0 },     },
	[ZoomLevel]           =       { { .f = 1.0 },   },
	[ClipboardNotPrimary] =       { { .i = 1 },  	},
};

static UriParameters uriparams[] = {
	{ "(://|\\.)suckless\\.org(/|$)", {
	  [JavaScript] = { { .i = 0 }, 1 },
	  [Plugins]    = { { .i = 0 }, 1 },
	}, },
};

/* default window size: width, height */
static int winsize[] = { 800, 600 };

static WebKitFindOptions findopts = WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE |
                                    WEBKIT_FIND_OPTIONS_WRAP_AROUND;

#define PROMPT_GO     "GO:"
#define PROMPT_FIND   "FIND:"
#define PROMPT_SEARCH "SEARCH:"

/* SETPROP(readprop, setprop, prompt)*/
#define SETPROP(r, s, p) { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "prop=\"$(printf '%b' \"$(xprop -id $1 $2 " \
             "| sed \"s/^$2(STRING) = //;s/^\\\"\\(.*\\)\\\"$/\\1/\" && cat ~/.surf/bookmarks)\" " \
             "| dmenu -l 10 -p \"$4\" -w $1)\" && " \
             "xprop -id $1 -f $3 8s -set $3 \"$prop\"", \
             "surf-setprop", winid, r, s, p, NULL \
        } \
}

#define GO() { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "prop=\"$(printf '%b' \"$(xprop -id $1 $2 " \
             "| sed \"s/^$2(STRING) = //;s/^\\\"\\(.*\\)\\\"$/\\1/\" && cat ~/.surf/bookmarks)\" " \
             "| dmenu -l 10 -p \"$4\" -w $1)\" && " \
             "xprop -id $1 -f $3 8s -set $3 \"$prop\"", \
             "surf-setprop", winid, "_SURF_URI", "_SURF_GO", PROMPT_GO, NULL \
        } \
}

#define FIND() { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "prop=\"$(printf '%b' \"$(xprop -id $1 $2 " \
             "| </dev/null)\" " \
             "| dmenu -p \"$4\" -w $1)\" && " \
             "xprop -id $1 -f $3 8s -set $3 \"$prop\"", \
             "surf-setprop", winid, "_SURF_FIND", "_SURF_FIND", PROMPT_FIND, NULL \
        } \
}

#define SEARCH() { \
        .v = (const char *[]){ "/bin/sh", "-c", \
             "xprop -id $1 -f $2 8s -set $2 \"" \
             "$(dmenu -p \"$3\" -w $1 < /dev/null)\"", \
             "surf-search", winid, "_SURF_SEARCH", PROMPT_SEARCH, NULL \
        } \
}

#define DLSTATUS { \
        .v = (const char *[]){ "st", "-e", "/bin/sh", "-c",\
            "while true; do cat $1/* 2>/dev/null || echo \"no hay descargas\";"\
            "A=; read A; "\
            "if [ $A = \"clean\" ]; then rm $1/*; fi; clear; done",\
            "surf-dlstatus", dlstatus, NULL } \
}

/* PLUMB(URI) */
/* This called when some URI which does not begin with "about:",
 * "http://" or "https://" should be opened.
 */
#define PLUMB(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "xdg-open \"$0\"", u, NULL \
        } \
}

/* VIDEOPLAY(URI) */
#define VIDEOPLAY(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "mpv --really-quiet \"$0\"", u, NULL \
        } \
}

/* VIDEODOWNLOAD(URI) */
#define VIDEODOWNLOAD(u) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "youtube-dl \"$0\"", u, NULL \
        } \
}

#define SETURI(p)       { .v = (char *[]){ "/bin/sh", "-c", \
"prop=\"`surf_history_dmenu.sh`\" &&" \
"xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
p, winid, NULL } }

/* BM_ADD(readprop) */
#define BM_ADD(r) {\
        .v = (const char *[]){ "/bin/sh", "-c", \
             "(echo $(xprop -id $0 $1) | cut -d '\"' -f2 " \
             "| sed 's/.*https*:\\/\\/\\(www\\.\\)\\?//' && cat ~/.surf/bookmarks) " \
             "| awk '!seen[$0]++' > ~/.surf/bookmarks.tmp && " \
             "mv ~/.surf/bookmarks.tmp ~/.surf/bookmarks", \
             winid, r, NULL \
        } \
}

/* styles */
/*
 * The iteration will stop at the first match, beginning at the beginning of
 * the list.
 */
static SiteSpecific styles[] = {
	/* regexp               file in $styledir */
	{ ".*suckless.org.*",   "suckless.css" },
	{ ".*phrack.org.*",     "phrack.css" },
	{ ".*wikipedia.org.*",  "wikipedia.css" },
	{ ".*cmake.org.*",  "cmake.css" },
	{ ".*youtube.com.*",  "youtube.css" },
	{ ".*archlinux.org.*",  "archlinux.css" },
	{ ".*duckduckgo.com.*", "duckduckgo.css" },
	{ ".*git.lan.deftech.eu.*", "gitlab.css" },
	{ ".*doxygen.*", "doxygen.css" },
	{ ".*github.com.*", "github.css" },
	{ ".*cppreference.com.*", "cppreference.css" },
	{ ".*",                 "default.css" },
};

/* certificates */
/*
 * Provide custom certificate for urls
 */
static SiteSpecific certs[] = {
	/* regexp               file in $certdir */
	{ "://suckless\\.org/", "suckless.org.crt" },
};

#define MODKEY GDK_CONTROL_MASK

#define SETURI(p)       { .v = (char *[]){ "/bin/sh", "-c", \
"prop=\"`~/.surf/dmenuhistory.sh`\" &&" \
"xprop -id $1 -f $0 8s -set $0 \"$prop\"", \
p, winid, NULL } }

/* hotkeys */
/*
 * If you use anything else but MODKEY and GDK_SHIFT_MASK, don't forget to
 * edit the CLEANMASK() macro.
 */
static Key keys[] = {
	/* modifier              keyval          function    arg */
	{ 0,                     GDK_KEY_i,      insert,     { .i = 1 } },
	{ 0,                     GDK_KEY_Escape, insert,     { .i = 0 } },

	{ 0,                     GDK_KEY_g,      spawn,      GO()     },
	{ 0,                     GDK_KEY_f,      spawn,      FIND()   },
	{ 0,                     GDK_KEY_slash,  spawn,      FIND()   },
	{ 0,                     GDK_KEY_s,      spawn,      SEARCH() },
	{ 0,                     GDK_KEY_m,      spawn,      BM_ADD("_SURF_URI") },

	{ 0,                     GDK_KEY_w,      playexternal, { 0 } },
	{ MODKEY,                GDK_KEY_w,      downloadvideo, { 0 } },

	{ 0,                     GDK_KEY_Escape, stop,       { 0 } },
	{ 0,                     GDK_KEY_c,      stop,       { 0 } },

	{ 0,                     GDK_KEY_c,      stop,       { 0 } },

	{ MODKEY,                GDK_KEY_r,      reload,     { .i = 1 } },
	{ 0,                     GDK_KEY_r,      reload,     { .i = 0 } },

	{ 0,                     GDK_KEY_l,      navigate,   { .i = +1 } },
	{ 0,                     GDK_KEY_h,      navigate,   { .i = -1 } },

	/* vertical and horizontal scrolling, in viewport percentage */
	{ 0,                     GDK_KEY_j,      scrollv,    { .i = +10 } },
	{ 0,                     GDK_KEY_k,      scrollv,    { .i = -10 } },
	{ 0,                     GDK_KEY_space,  scrollv,    { .i = +50 } },
	{ 0,                     GDK_KEY_b,      scrollv,    { .i = -50 } },
	{ 0,                     GDK_KEY_i,      scrollh,    { .i = +10 } },
	{ 0,                     GDK_KEY_u,      scrollh,    { .i = -10 } },


	{ 0|GDK_SHIFT_MASK,      GDK_KEY_j,      zoom,       { .i = -1 } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_k,      zoom,       { .i = +1 } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_q,      zoom,       { .i = 0  } },
	{ 0,                     GDK_KEY_minus,  zoom,       { .i = -1 } },
	{ 0,                     GDK_KEY_plus,   zoom,       { .i = +1 } },

	{ 0,                     GDK_KEY_p,      clipboard,  { .i = 1 } },
	{ 0,                     GDK_KEY_y,      clipboard,  { .i = 0 } },

	{ 0,                     GDK_KEY_n,      find,       { .i = +1 } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_n,      find,       { .i = -1 } },

	{ MODKEY,                GDK_KEY_p,      print,      { 0 } },
	{ 0,                     GDK_KEY_t,      showcert,   { 0 } },

	{ 0|GDK_SHIFT_MASK,      GDK_KEY_a,      togglecookiepolicy, { 0 } },
	{ 0,                     GDK_KEY_F11,    togglefullscreen, { 0 } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_o,      toggleinspector, { 0 } },

	{ 0|GDK_SHIFT_MASK,      GDK_KEY_c,      toggle,     { .i = CaretBrowsing } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_f,      toggle,     { .i = FrameFlattening } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_g,      toggle,     { .i = Geolocation } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_s,      toggle,     { .i = JavaScript } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_i,      toggle,     { .i = LoadImages } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_v,      toggle,     { .i = Plugins } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_b,      toggle,     { .i = ScrollBars } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_t,      toggle,     { .i = StrictTLS } },
	{ 0|GDK_SHIFT_MASK,      GDK_KEY_m,      toggle,     { .i = Style } },
    { 0,                     GDK_KEY_Return, spawn,      SETURI("_SURF_GO") },

	{ 0,                     GDK_KEY_w,      playexternal, { 0 } },
	{ 0,                     GDK_KEY_d,      spawndls,   { 0 } },
};

/* button definitions */
/* target can be OnDoc, OnLink, OnImg, OnMedia, OnEdit, OnBar, OnSel, OnAny */
static Button buttons[] = {
	/* target       event mask      button  function        argument        stop event */
	{ OnLink,       0,              2,      clicknewwindow, { .i = 0 },     1 },
	{ OnLink,       MODKEY,         2,      clicknewwindow, { .i = 1 },     1 },
	{ OnLink,       MODKEY,         1,      clicknewwindow, { .i = 1 },     1 },
	{ OnAny,        0,              8,      clicknavigate,  { .i = -1 },    1 },
	{ OnAny,        0,              9,      clicknavigate,  { .i = +1 },    1 },
	{ OnMedia,      MODKEY,         1,      clickexternplayer, { 0 },       1 },
};

#define HOMEPAGE "http://phrack.org/"
