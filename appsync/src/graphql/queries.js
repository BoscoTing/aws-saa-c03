/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getMyAppsync = /* GraphQL */ `
  query GetMyAppsync($pk: String!) {
    getMyAppsync(pk: $pk) {
      pk
      fruit
      level
      __typename
    }
  }
`;
export const listMyAppsyncs = /* GraphQL */ `
  query ListMyAppsyncs(
    $filter: TableMyAppsyncFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listMyAppsyncs(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        pk
        fruit
        level
        __typename
      }
      nextToken
      __typename
    }
  }
`;
