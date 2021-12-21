const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#666666", /* black   */
  [1] = "#CC6699", /* red     */
  [2] = "#99CC66", /* green   */
  [3] = "#CC9966", /* yellow  */
  [4] = "#6699CC", /* blue    */
  [5] = "#9966CC", /* magenta */
  [6] = "#66CC99", /* cyan    */
  [7] = "#CCCCCC", /* white   */

  /* 8 bright colors */
  [8]  = "#999999",  /* black   */
  [9]  = "#CC6699",  /* red     */
  [10] = "#99CC66", /* green   */
  [11] = "#CC9966", /* yellow  */
  [12] = "#6699CC", /* blue    */
  [13] = "#9966CC", /* magenta */
  [14] = "#66CC99", /* cyan    */
  [15] = "#CCCCCC", /* white   */

  /* special colors */
  [256] = "#333333", /* background */
  [257] = "#CCCCCC", /* foreground */
  [258] = "#FF99CC",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
