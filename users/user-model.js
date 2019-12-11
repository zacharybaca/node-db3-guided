const db = require('../data/db-config.js');

module.exports = {
  allUsers,
  findById,
  addUser,
  findUserPosts
};

function allUsers() {
  return db('users');
}

function findById(id) {
  return db('users')
    .where({ id })
    .first();
}

function addUser(user) {
  return db('users')
    .insert(user, 'id')
    .then(ids => {
      const [id] = ids;
      return findById(id);
    });
}

function findUserPosts(userId) {
  return db('posts as p')
    .select('p.id', 'p.contents as Quote', 'u.username as Author')
    .join('users as u', 'p.user_id', 'u.id')
    .where('user_id', userId);
}
