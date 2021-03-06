echo "   ___                   _              _____   _   __                     _ "
echo "  |_  |                 | |            /  __ \ | | / /                    | |"
echo "    | |_   _ _ __  _   _| |_ ___ _ __  | /  \/ | |/ /  ___ _ __ _ __   ___| |"
echo "    | | | | | '_ \| | | | __/ _ \ '__| | |     |    \ / _ \ '__| '_ \ / _ \ |"
echo "/\__/ / |_| | |_) | |_| | ||  __/ |    | \__/\ | |\  \  __/ |  | | | |  __/ |"
echo "\____/ \__._| .__/ \__. |\__\___|_|     \____/ \_| \_/\___|_|  |_| |_|\___|_|"
echo "            | |     __/ |                                                    "
echo "            |_|    |___/                                                     "

tag_name="$1"
repository="${2:-https://github.com/brendan-rius/jupyter-c-kernel.git}"
repo_name="jupyter-c-kernel"

set -x

echo ":: Installing python module C kernel."
pip install $repo_name; echo "Done. "
echo ":: Cloning Jupyter C-kernel... "
git clone $repository $repo_name; echo "Done. "
cd $repo_name
if [ ! -z "$tag_name" ]; then
    echo ":: Using tag $tag_name"
    git checkout "$tag_name"; echo "Done."
fi
echo ":: Installing kernel specification"
jupyter-kernelspec install c_spec/ ; echo "Done."
echo ":: Removing repository"
cd ..
rm -rf jupyter-c-kernel/
echo "Completed! Installation successful. You can type jupyter-notebook and be happy"
