class Adapter {
  constructor(url) {
    this.url = url;
  }

  getResources() {
    return fetch(this.url).then(res => res.json());
  }

  getResource(id) {
    return fetch(`${this.url}/${id}`).then(res => res.json());
  }

  createResource(body) {
    return fetch(this.url, {
      method: 'POST',
      body: JSON.stringify(body),
      headers: {
        'Accept': 'application/json'
        'Content-Type': 'application/json'
      }
    }).then(res => res.json());
  }

  editResource(id, body) {
    return fetch(`${this.url}/${id}`, {
      method: 'PATCH',
      body: JSON.stringify(body),
      headers: {
        'Accept': 'application/json'
        'Content-Type': 'application/json'
      }
    }).then(res => res.json());
  }

  deleteResource(id) {
    return fetch(`${this.url}/${id}`, {
      method: 'DELETE'
    });
  }
}
