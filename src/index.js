const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")

let store = { npcs: [], locations: [], dogCollectables: [] }

document.addEventListener('DOMContentLoaded', () => {
  npcAdapter.getResources()
  .then(npcsJSON => Npc.createNpcs(npcsJSON))
  .then(npcs => {
    npcs.forEach(npc => npc.getMarker())
  });
})
