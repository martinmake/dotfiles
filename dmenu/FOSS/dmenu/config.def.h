/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int instant = 0;                /* -i  option; if 0, dmenu selects instantly when there is only one match     */
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] =
{                           /*    fg         bg   */
	[SchemeNorm]          = { "#bbbbbb", "#222222" },
	[SchemeSel]           = { "#eeeeee", "#005577" },
	[SchemeSelHighlight]  = { "#fc02f8", "#005577" },
	[SchemeNormHighlight] = { "#e941fc", "#222222" },
	[SchemeOut]           = { "#000000", "#00ffff" },
	[SchemeMid]           = { "#eeeeee", "#303030" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int lineheight = 20;         /* -h option; minimum height of a menu line     */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 0;