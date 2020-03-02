alias open=nautilus
export UWM_PASSWORD="PASSWORD_HERE"
export LOCAL_PASSWORD="PASSWORD_HERE"

# dos2unix fast ...
function dos2unix() {
  tr -d '\r' < "$1" > t
  mv -f t "$1"
}

export -f dos2unix

# login to AFS fast ...
function klog() {
    echo "AFS Login ...";
    echo ${UWM_PASSWORD} | kinit hesamian@CS.UWM.EDU;
    aklog;
    tokens;
    printf "\nFinished Login ...\n"
}
export -f klog

# flush-dns fast ...
function flush-dns() {
    echo "Flushing DNS";
    sudo systemd-resolve --flush-caches;
    sudo systemd-resolve --statistics;
}
export -f flush-dns

# login to andrew fast ...
function andrew() {
  sshpass -p ${UWM_PASSWORD} ssh hesamian@andrew.cs.uwm.edu -p 53211 -tt
}

export -f andrew

# login to local fast ...
function amir-pc() {
  sshpass -p ${LOCAL_PASSWORD} ssh amir-pc@local.hesamian.com -p 53211 -tt
}

export -f amir-pc

function publish() {
  git add .;
  git commit -m "wip ...";
  git push;
}

export -f publish

export PATH="/snap/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools/"
export PATH="$PATH:$HOME/.local/bin"
