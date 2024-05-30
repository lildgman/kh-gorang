<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${contextPath }/resources/css/board/commonWrite.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <!-- 서머노트를 위해 추가해야할 부분 -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/resources/summernote/customsummernote.js"></script>
            <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/customsummernote.css">

            <script src="${contextPath}/resources/js/board/commonWrite.js"></script>
        </head>

        <body>
            <form action="${contextPath}/insert.bo" method="post">
                <main id="common-write">
                    <div id="write-top">
                        <div id="writeBtnSection">
                            <div id="tempStorageBtn">
                                <input type="button" value="임시저장" id="saveContentBtn">
                            </div>
                            <div id="writeSubmitBtn">
                                <input type="submit" value="등록하기">
                            </div>
                        </div>
                    </div>
                    <div id="write-container">
                        <div id="writeTitleSection">
                            <div id="selectCategory">
                                <select name="boardCategory" id="boardCategory" >
                                    <option selected disabled hidden>카테고리</option>
                                    <option value="#일상">#일상</option>
                                    <option value="#질문">#질문</option>
                                    <option value="#노하우">#노하우</option>
                                    <option value="#꿀팁">#꿀팁</option>
                                    <option value="#보관법">#보관법</option>
                                </select>
                            </div>
                            <div id="writeTitle">
                                <input type="text" placeholder="제목을 입력해주세요." id="boardTitle">
                            </div>
                        </div>
                        <div id="writeUploadThumbnail">
                            <div id="uploadThumbnailSection">
                                <div id="uploadThumbnailSpan">
                                    <span>대표이미지를 업로드 해주세요.</span>
                                </div>
                                <div id="uploadThumbSizeSpan">
                                    <span>*권장 사이즈</span><br>
                                    <span>모바일: 1920 x 1920, 최소 1400 x 1400(1:1 비율)</span><br>
                                    <span>PC: 1920 x 1080, 최소 1400 x 787(16:9
                                        비율)</span>
                                </div>
                                <div id="uploadThumbBtn">
                                    <label className="boardThumbnail-button" for="boardThumbnail">
                                        대표이미지 넣기
                                    </label>
                                    <input type="file" id="boardThumbnail"/>
                                </div>
                            </div>
                        </div>
                        <textarea class="summernote" name="editordata" id="boardContent"></textarea>
                    </div>
                </main>
            </form>
            <jsp:include page="../common/footer.jsp" />
            <script>
                $('.summernote').summernote({
                    height: 329,
                    lang: "ko-KR",
                    toolbar: [
                        ['insert', ['link', 'picture']],
                        ['style', ['bold', 'italic', 'underline', 'clear']],
                        ['font', ['strikethrough']],
                        ['fontsize', ['fontsize']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],

                    ]
                });

            </script>
        </body>

        </html>