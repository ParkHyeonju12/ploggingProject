function loadImg(f){
    console.log(f.files);
    
    if(f.files.length !=0 && f.files[0] != 0 ){
        const reader = new FileReader(); // 파일 정보를 읽어올 수 있는 객체
        reader.readAsDataURL(f.files[0]);//선택한 파일 정보 읽어옴
        //파일리더가 파일을 다 읽어오면 동작할 함수 작성
        reader.onload = function(e){
            $("#story-img-view").attr("src",e.target.result);
        }
    }else{
        $("#story-img-view").attr("src","");
    }
}