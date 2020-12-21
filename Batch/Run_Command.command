project_root="$(dirname "$(dirname "$0")")"
test_runner="$project_root/src/runner.py"
python3 $test_runner "%~1"