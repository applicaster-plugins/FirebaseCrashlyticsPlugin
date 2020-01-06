#Choose a target
target_name="Zapp-App"

# Get project directory path
current_pwd="$PWD"

echo "Current pwd dir is $current_pwd"

#project_dir=`cd "../../"; pwd`
#cd "$current_pwd"

# Get .xcodeproj file path
project_file=`find "$current_pwd" -maxdepth 1 -name "*.xcodeproj" | tail -1`

if [ -z "$project_file" ]; then
    echo "Can't find the .xcodeproj file, going to skip this script. It's properly a debug build anyway..:)"
else
    # add script to project
    ruby add_scripts_to_project.rb $target_name $project_file
fi
