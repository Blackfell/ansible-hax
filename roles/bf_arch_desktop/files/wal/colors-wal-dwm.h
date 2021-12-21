static const char norm_fg[] = "#CCCCCC";
static const char norm_bg[] = "#666666";
static const char norm_border[] = "#999999";

static const char sel_fg[] = "#CCCCCC";
static const char sel_bg[] = "#99CC66";
static const char sel_border[] = "#CCCCCC";

static const char urg_fg[] = "#CCCCCC";
static const char urg_bg[] = "#CC6699";
static const char urg_border[] = "#CC6699";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
