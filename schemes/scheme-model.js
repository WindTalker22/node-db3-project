const db = require('../data/db-config.js')

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
}

// READ/GET All
function find() {
  return db('schemes')
}

// READ/GET By ID
function findById(id) {
  return db('schemes')
    .where({ id })
    .first()
}

// READ/GET Steps By ID
function findSteps(id) {
  return db('steps')
    .join('schemes', 'schemes.id', 'steps.scheme_id')
    .select('steps.step_number', 'steps.instructions', 'schemes.scheme_name')
    .where('scheme_id', id)
    .orderBy('steps.step_number')
}

// CREATE/POST new Scheme
function add(scheme) {
  return db('schemes').insert(scheme)
}

// CREAT/POST new Step
function addStep(step, id) {
  return db('steps').insert({ ...step, scheme_id: id })
}

// UPDATE/PUT
function update(changes, id) {
  return db('schemes')
    .where({ id })
    .update(changes)
}

// DELETE/REMOVE
function remove(id) {
  return db('schemes')
    .where({ id })
    .del()
}
