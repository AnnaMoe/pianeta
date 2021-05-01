import "granim";

const initGranim = () => {
    console.log("granim test")
    if (document.querySelector('.granim-gradient')) {
        var granimInstance = new Granim({
            element: '.granim-gradient',
            name: 'granim',
            opacity: [1, 1],
            states : {
                "default-state": {
                    gradients: [
                        ['#834D9B', '#D04ED6'],
                        ['#1CD8D2', '#93EDC7']
                    ]
                }
            }
        });
    }
}

export default initGranim;