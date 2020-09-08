#lists all dirs and procedd git update for selected dirs
$rootdir=$PWD
$dirs=ls (put here your filter and conditions)
foreach ($dir in $dirs){
cd $dir;
git pull
}
cd $rootdir
