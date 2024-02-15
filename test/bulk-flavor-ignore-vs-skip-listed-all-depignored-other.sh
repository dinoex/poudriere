FLAVOR_DEFAULT_ALL=no
FLAVOR_DEFAULT=-

LISTPORTS="misc/foo-all-DEPIGNORED@flav"
OVERLAYS="overlay omnibus"
. common.bulk.sh

do_bulk -n ${LISTPORTS}
assert 0 $? "Bulk should pass"

EXPECTED_IGNORED="misc/foo-dep-FLAVORS-unsorted@depignored"
EXPECTED_SKIPPED="misc/foo-all-DEPIGNORED@flav"
EXPECTED_QUEUED="ports-mgmt/pkg"
EXPECTED_LISTED="misc/foo-all-DEPIGNORED@flav"

assert_bulk_queue_and_stats
