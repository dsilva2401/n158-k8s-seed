
const handler = (context, next, complete) => {
  complete(200, { asd: 123 });
}

export default handler;
