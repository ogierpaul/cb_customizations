repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root" || exit

target="dev"
reference="dev"

# Parse named arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -r|--reference)
            reference="$2"
            shift 2
            ;;
        -t|--target)
            target="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
done

git checkout $target
git merge origin/$target
cd $repo_root/cb_customizations
dbt run --target $target