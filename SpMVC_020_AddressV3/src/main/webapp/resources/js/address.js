document.addEventListener("DOMContentLoaded", () => {
  const home = document.querySelector("li.home");
  const address_table = document.querySelector("table.address");

  if (home) {
    home.addEventListener("click", () => {
      let url = `${rootPath}`;
      url += "/";
      document.location.href = url;
    });
  }
  address_table?.addEventListener("click", (e) => {
    const td = e.target;

    if (td.tagName === "TD") {
      const tr = td.closest("TR");
      const a_seq = tr.dataset.seq;
      // alert(isbn);
      document.location.href = `${rootPath}/detail?seq=${a_seq}`;
    }
  });
});
