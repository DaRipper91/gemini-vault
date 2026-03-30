#!/bin/bash

STAGING_DIR="Desktop_Staging"
mkdir -p "$STAGING_DIR"/{global,projects,extensions}

copy_file() {
    local src="$1"
    local category="$2"
    local rel_path="${src#/home/daripper/}"
    local dest_path="$STAGING_DIR/$category/$rel_path"
    
    mkdir -p "$(dirname "$dest_path")"
    cp "$src" "$dest_path"
}

# Find files, skipping node_modules, .git, and .cache. Ignore permission denied errors.
find /home/daripper -type d \( -name "node_modules" -o -name ".git" -o -name ".cache" \) -prune -o \
    -type f \( -name "GEMINI.md" -o -name "SKILL.md" -o -path "*/commands/*.toml" \) -print 2>/dev/null > found_assets.txt

while IFS= read -r file; do
    # Skip the current staging and output files to prevent infinite loops
    if [[ "$file" == *"/gemini-vault/Desktop_Staging/"* ]] || [[ "$file" == *"/gemini-vault/Desktop/"* ]]; then
        continue
    fi

    # Categorize
    if [[ "$file" == /home/daripper/.gemini/extensions/* ]]; then
        copy_file "$file" "extensions"
    elif [[ "$file" == /home/daripper/.gemini/* ]]; then
        copy_file "$file" "global"
    else
        copy_file "$file" "projects"
    fi
done < found_assets.txt

echo "Staging complete."
