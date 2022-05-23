$(function () {
    $("a").click(function (e) {
        e.preventDefault();
        if (e.target["id"] === "deleteAluno" || e.target["id"] === "deleteCurso") {
            var objDeletado = (e.target["id"] === "deleteAluno") ? "aluno" : "curso";
            bootbox.confirm({
                centerVertical: true,
                title: "Deletar?",
                closeButton: false,
                message: "Vecê realmente quer <b>DELETAR</b> este " + objDeletado + "?",
                buttons: {
                    confirm: {
                        label: "Sim",
                        className: "btn-danger"
                    },
                    cancel: {
                        label: "Não",
                        className: "btn-success"
                    }
                },
                callback: function (result) {
                    if (result) {
                        window.location.href = e.target["href"];
                    }
                }
            });
        } else {
            window.location.href = e.target["href"];
        }
    });
});