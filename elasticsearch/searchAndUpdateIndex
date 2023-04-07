//in devtools
POST searchcase*/_search
{
  "query": {
    "match": {
      "cidla": "SC0000000004187754"
    }
  }
}
POST searchcase*/_update_by_query
{
  "script": {
    "source": "ctx._source.caseStatus='PROCESSED';ctx._source.casePhase='COMPLETED'"
  },
  "query": {
    "match": {
      "cidla": "SC0000000004187754"
    }
  }
}
