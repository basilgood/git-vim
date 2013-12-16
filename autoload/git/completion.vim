"=============================================================================
" FILE: completion.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu@gmail.com>(Modified)
" Last Modified: 17 Mar 2010
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

function! git#completion#do_completion(args)"{{{
  if len(a:args) <= 2
    return [0, git#completion#git(a:args)]
  else
    return call('git#completion#' . substitute(a:args[1], '-', '_', 'g'), [a:args])
  endif
endfunction"}}}

" List all git commands.
function! git#completion#git(args)"{{{
  return ['add', 'bisect', 'branch', 'checkout', 'clone', 'commit', 'diff', 'fetch',
        \'grep', 'init', 'log', 'merge', 'mv', 'pull', 'push', 'rebase', 'reset', 'rm',
        \'show', 'status', 'tag', 'clean'] + s:hub_commands()
endfunction"}}}
function! s:hub_commands()
  return !executable('hub') ? [] : ['fork', 'pull-request', 'browse']
endfunction

function! git#completion#add(args)"{{{
  return [0, ['-n', '-v', '--force', '-f', '--interactive', '-i', '--patch', '-p', '--edit', '-e', '--no-all', '--all', '--no-ignore-removal', '--ignore_removal', '--update', '-u', '--intent-to-add', '-N', '--refresh', '--ignore-errors', '--ignore-missing', '--'] + s:get_files()]
endfunction"}}}
function! git#completion#blame(args)"{{{
  return [0]
endfunction"}}}
function! git#completion#branch(args)"{{{
  return [1, ['-r']]
endfunction"}}}
function! git#completion#checkout(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#clone(args)"{{{
  return [0, []]
endfunction"}}}
function! git#completion#config(args)"{{{
  return [0, ['--config']]
endfunction"}}}
function! git#completion#commit(args)"{{{
  return [0, ['-m', 'a', '-v', '--amend']]
endfunction"}}}
function! git#completion#describe(args)"{{{
  return [1, ['--contains']]
endfunction"}}}
function! git#completion#diff(args)"{{{
  return [1, ['--cached']]
endfunction"}}}
function! git#completion#init(args)"{{{
  return [0, ['--bare', '--shared']]
endfunction"}}}
function! git#completion#log(args)"{{{
  return [1, ['-p', '--pretty=short', '--grep=', '--left-right']]
endfunction"}}}
function! git#completion#merge(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#push(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#pull(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#reset(args)"{{{
  return [1, ['--hard', '--soft']]
endfunction"}}}
function! git#completion#rebase(args)"{{{
  return [1, ['-i', '--continue', '--abort', '--skip']]
endfunction"}}}
function! git#completion#revert(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#rev_parse(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#show(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#status(args)"{{{
  return [1, []]
endfunction"}}}
function! git#completion#stash(args)"{{{
  return [0, ['pop', 'apply', 'branch', 'clear', 'create', 'drop', 'list', 'save', 'show']]
endfunction"}}}
function! git#completion#tag(args)"{{{
  return [1, ['-a', '-l', '-n', '-d']]
endfunction"}}}
function! git#completion#var(args)"{{{
  return [0, []]
endfunction"}}}
function! git#completion#clean(args)"{{{
  return [0, ['-d', '--force', '-f', '-i', '--interactive', '-n', '--dry-run', '-q', '--quit', '-x', '-X', '-e', '--exclude=']]
endfunction"}}}
function! git#completion#pull_request(args)"{{{
  return [0, ['-m', '-b', '--base', '-h', '--head', '-i', '--issue']]
endfunction"}}}
function! git#completion#clean(args)"{{{
  return ['-f', '-d']
endfunction"}}}

function! s:get_files()
  return split(glob('*'), '\n')
endfunction

