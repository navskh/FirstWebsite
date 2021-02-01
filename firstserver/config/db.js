const mssql = require('mssql');

var config = {
  "user": "dev01", //default is sa
  "password": "jos0109!",
  "server": "localhost", // for local machine
  "database": "TEST", // name of database
}
const pools = {}

// manage a set of pools by name (config will be required to create the pool)
// a pool will be removed when it is closed
async function getPool(name) {
  if (!Object.prototype.hasOwnProperty.call(pools, name)) {
    const pool = new mssql.ConnectionPool(config)
    const close = pool.close.bind(pool)
    pool.close = (...args) => {
      delete pools[name]
      return close(...args)
    }
    await pool.connect()
    pools[name] = pool
  }
  return pools[name]
}

// close all pools
function closeAll() {
  return Promise.all(Object.values(pools).map((pool) => {
    return pool.close()
  }))
}

module.exports = {
  closeAll,
  getPool
}