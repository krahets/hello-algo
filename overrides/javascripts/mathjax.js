window.MathJax = {
    tex: {
        inlineMath: [["\\(", "\\)"]],
        displayMath: [["\\[", "\\]"]],
        processEscapes: true,
        processEnvironments: true,
    },
    options: {
        ignoreHtmlClass: ".*|",
        processHtmlClass: "arithmatex",
        enableMenu: false,
    },
};

document$.subscribe(() => {
    var scriptLoaded = false;
    var backupAttempted = false;
    var timeoutId;

    function addScript(src, isBackup = false) {
        var script = document.createElement('script');
        script.src = src;
        script.type = 'text/javascript';
        script.onload = function () {
            scriptLoaded = true;
            clearTimeout(timeoutId);  // 清除定时器
            MathJax.typesetPromise();  // 确保脚本加载完成后执行
        };
        script.onerror = function () {
            if (!isBackup && !backupAttempted) {
                loadBackupScript();
            }
        };
        document.head.appendChild(script);
    }

    function loadBackupScript() {
        if (!scriptLoaded && !backupAttempted) {  // 防止重复加载备用脚本
            backupAttempted = true;  // 标记备用脚本已尝试加载
            addScript('https://cdn.staticfile.org/mathjax/3.2.2/es5/tex-mml-chtml.js', true);
        }
    }

    // 先尝试从 jsdelivr 加载 MathJax 脚本
    addScript('https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js');

    // 超时或失败则尝试 staticfile
    timeoutId = setTimeout(function () {
        if (!scriptLoaded && !backupAttempted) {
            loadBackupScript();
        }
    }, 5000);
});