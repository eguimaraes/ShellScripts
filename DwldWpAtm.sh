#https://edvaldoguimaraes.com.br/2024/10/10/automating-the-download-and-setup-of-multiple-wordpress-versions-in-specific-directories/
#!/bin/bash

# List of WordPress versions to download
versions=("5.6" "5.7" "5.8" "5.9")

# Function to download and extract each version
function download_wp {
    version=$1
    target_dir=$2
    mkdir -p "$target_dir"
    wget "https://wordpress.org/wordpress-$version.tar.gz" -O "$target_dir/wordpress-$version.tar.gz"
    tar -xzf "$target_dir/wordpress-$version.tar.gz" -C "$target_dir"
    rm "$target_dir/wordpress-$version.tar.gz"
    echo "WordPress $version has been downloaded and extracted to $target_dir"
}

# Loop through each version and call the download function
for version in "${versions[@]}"; do
    target_directory="wordpress_$version"
    download_wp "$version" "$target_directory"
done

echo "All specified WordPress versions have been downloaded."