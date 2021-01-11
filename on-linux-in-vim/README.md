# Manual Revision of Segment-Level Alignment between Two or Three Files in VIM
Ondrej Bojar, bojar@ufal.mff.cuni.cz

## Technical Instructions

Use the ``vimpar`` wrapper to open two or three files in ``vim``. ``vimpar`` will also ensure that lines across all the files are padded to the same length before ``vim`` is run and that any padding is again removed after ``vim`` is finished.

**Warning**: No backup files are made!

```
vimpar fileA fileB fileC
```

Typically, you want to review the original speech transcript (OSt) and text translation of German (TTde) and Czech (TTcs); Czech can come in multiple versions. So the command could be:

```
vimpar spanish.OSt spanish.TTcs spanish.TTde
```

This is what ``vimpar`` calls internally:

```
vim fileA fileB
:source manual-alignment.vimrc
```

And for three files:

```
vim fileA fileB fileC
:source manual-alignment.vimrc
:call Third()
```

## Commands to Use in VIM

Upon sourcing the settings, the second file will appear side by side and the
following macros will make your alignment easier.

Not all macros are listed here, refer to the file itself for more details. Some macros listed here are standard vim macros.

- **ctrl W, ctrl W** (indeed, twice, a standard vim thing): move to the other window
- **w1**: move to window 1 (similarly **w2** and **w3**)
- **shift UP/DOWN**: move cursor only in one of the windows
- **shift LEFT/RIGHT**: append a chunk of spaces to the current line of the left or right window. This is useful to make both lines equally long and wrap to the same number of lines, so that the alignment works nicely visually. ``vimpar`` handles this pretty well but sometimes the columns in ``vim`` are not of equal width and manual padding is still necessary.
- **SPACE 1**: as above (extend line with spaces), for window 1 (similarly **SPACE 2** and **SPACE 3**)
- **Z CR**: "z"oom (scroll) so that the current line is displayed near the top of the screen. This is useful to see more context below the current line.
- **ctrl UP/DOWN**: move to top/bottom of all files
- **:wall**: save all files.
- **:wqall**: save all files and exit.
