"spellcheck
set spelllang=en
set spellfile=$HOME/.config/vim/spellcheckwords.add

nmap <space><space> /<++><CR>xxxxi
nmap zle i\begin{}<CR><CR>\end{<++>}<ESC>kk$i
nmap zli i\textit{}<ESC>i
nmap zlb i\textbf{}<ESC>i
nmap zlt i\text{}<ESC>i
nmap zla i\begin{align*}<CR><CR>\end{align*}<ESC>ki
nmap zlp i\begin{proof}<CR><CR>\end{proof}<ESC>ki
nmap zlf i\dfrac{}{<++>}<ESC>6hi

"set letters
nmap zlsr i\mathbb{R}<ESC>
nmap zlsn i\mathbb{N}<ESC>
nmap zlsz i\mathbb{Z}<ESC>
nmap zlsc i\mathbb{C}<ESC>

"sum
nmap zlS i\sum\limits_{x=1}^\infty <ESC>
"integral
nmap zlI i\int\limits_{1}^\inftydx <ESC>hi
"limit
nmap zlL i\lim_{x\to\infty}<ESC>
"derivative
nmap zlD i\frac{d}{dx}<ESC>

nmap zl{ i\{\}<ESC>2hi
nmap zl[ i\bigl[\bigr]<ESC>5hi
nmap zl< i\langle \rangle<ESC>6hi

map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
map <F6> :silent exec "!mupdf '%:r'.pdf &"<CR>
