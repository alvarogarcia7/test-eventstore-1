
.PHONY: run
run:
	docker run --name eventstore-node -d -p 2113:2113 -p 1113:1113 eventstore/eventstore


.PHONY: stop
stop:
	docker kill eventstore-node; docker rm eventstore-node


.PHONY: open-console
open-console:
	echo "Go to http://127.0.0.1:2113. Use admin:changeit"

.PHONY: write-event
write-event:
	curl -i -d @event.txt "http://127.0.0.1:2113/streams/newstream" -H "Content-Type:application/vnd.eventstore.events+json"

.PHONY: read-event
read-event:
	curl -i -H "Accept:application/vnd.eventstore.atom+json" "http://127.0.0.1:2113/streams/newstream"
	curl -i -H "Accept:application/vnd.eventstore.atom+json" "http://127.0.0.1:2113/streams/newstream/range/1/20"


