const path = require('path');


function analyseUpdatedFiles(filteredUpdatedFiles, caller, groupPath, stackFunctions) {

    let updatedFunctions = [];

    for (var i = 0; i < filteredUpdatedFiles.length; i++) {
        const updatedFile = filteredUpdatedFiles[i];
        console.log('updatedFile:', updatedFile);

        // Ignore changes if the file is prefixed with a "." or "_"
        if (!(updatedFile.startsWith('.') || updatedFile.startsWith('_'))
            && !(caller == "build_push" && updatedFile.endsWith('deploy.yml'))) {

            if (updatedFile.includes('/')) {

                const functionPath = path.dirname(path.relative(groupPath, updatedFile));
                console.log('functionPath:', functionPath);

                if (stackFunctions.includes(functionPath) && !updatedFunctions.includes(functionPath)) {
                    console.log('case 2a - changes to directory or file specific to a faas-function');
                    updatedFunctions.push(functionPath);
                } else if (!stackFunctions.includes(functionPath)) {
                    console.log('case 2b - changes to directory or file common to all stack functions');
                    updatedFunctions = stackFunctions;
                    break;
                } else {
                    console.log(`Nothing added for ${functionPath}`);
                }

            } else {
                console.log('case 1 - changes at root of repo');
                updatedFunctions = stackFunctions;
                break;
            }
        }
    }
    return updatedFunctions;

}

module.exports = analyseUpdatedFiles;