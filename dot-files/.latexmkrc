# creates a "build" dir and puts all the output files in there
# NOTE: create a symlink to the main ".pdf" in the root dir
$out_dir = "build";system ("find . -type d ! -path './.git*' ! -path './build*' ! -path './$out_dir*' -exec mkdir -p $out_dir/{} \\;");
$silent = 1; # reduces output lines, show most relevant only
$preview_continuous_mode = 0;
$pdf_previewer = "start okular %O %S";
$pdf_mode = 1;
sub clean_mendeley_bib{ 
    system("bash ~/.texmf/clean-mendeley-bib.sh"); 
}
clean_mendeley_bib();