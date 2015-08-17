#!/bin/sh
# POSIX

while :; do
    case $1 in
        -m|--message)
            if [ -n "$2" ]; then
                message=$2
                shift 2
                continue
            else
                printf 'ERROR: "--message" requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        -l|--level)
            if [ -n "$2" ]; then
                level=$2
                shift 2
                continue
            else
                printf 'ERROR: "--level" requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        --)
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)
            break
    esac

    shift
done

if [ -z "$message" ]; then
    printf 'ERROR: option --message "MESSAGE" not given.\n' >&2
    exit 1
fi
if [ -z "$level" ]; then
    printf 'ERROR: option --level "LEVEL" not given.\n' >&2
    exit 1
fi

curl --data "message=$message&level=level" http://localhost:8080/messages/
printf '\n'